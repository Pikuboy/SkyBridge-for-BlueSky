import 'dart:convert';

import 'package:atproto/core.dart' as atp;
import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:http/http.dart' as http;
import 'package:sky_bridge/crypto.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/oauth/oauth_access_token.dart';
import 'package:sky_bridge/models/preferences.dart';
import 'package:sky_bridge/src/generated/prisma/prisma_client.dart';

/// Global client
final httpClient = http.Client();

/// Resolves the PDS host (without scheme) for a given handle.
/// Returns e.g. "bsky.social" or "eurosky.social".
/// Falls back to "bsky.social" on any error.
Future<String> resolvePdsHost(String identifier) async {
  try {
    final handle = identifier.startsWith('@')
        ? identifier.substring(1)
        : identifier;

    // Email identifiers cannot be resolved to a PDS via DID — fall back.
    if (handle.contains('@') && !handle.startsWith('did:')) {
      return 'bsky.social';
    }

    String did = handle;

    // Resolve handle -> DID via the public AppView.
    if (!handle.startsWith('did:')) {
      final url = Uri.parse(
        'https://public.api.bsky.app/xrpc/com.atproto.identity.resolveHandle'
        '?handle=$handle',
      );
      final response = await httpClient.get(url);
      if (response.statusCode != 200) return 'bsky.social';
      did = (jsonDecode(response.body) as Map<String, dynamic>)['did'] as String;
    }

    // Resolve did:plc -> DID document -> PDS service endpoint.
    if (did.startsWith('did:plc:')) {
      final url = Uri.parse('https://plc.directory/$did');
      final response = await httpClient.get(url);
      if (response.statusCode != 200) return 'bsky.social';
      final services =
          (jsonDecode(response.body) as Map<String, dynamic>)['service']
              as List<dynamic>?;
      if (services != null) {
        for (final svc in services.cast<Map<String, dynamic>>()) {
          if (svc['id'] == '#atproto_pds' ||
              svc['type'] == 'AtprotoPersonalDataServer') {
            final endpoint = svc['serviceEndpoint'] as String;
            // Strip scheme — the lib expects just the host.
            return endpoint
                .replaceFirst('https://', '')
                .replaceFirst('http://', '');
          }
        }
      }
    }

    if (did.startsWith('did:web:')) {
      return did.substring('did:web:'.length);
    }
  } catch (e) {
    print('resolvePdsHost error for $identifier: $e');
  }
  return 'bsky.social';
}

/// Takes an IP address and ensures that authentication attempts are not
/// being made too frequently. Bluesky now has quite aggressive rate limiting
/// for authentication attempts, so we have to do the same.
///
/// Returns true if the IP has hit the rate limit, false otherwise.
Future<void> incrementFailedAuthAttempt(RequestContext context) async {
  final ip = context.request.headers['X-Forwarded-For'] ??
      context.request.connectionInfo.remoteAddress.address;

  // Check if we already have a rate limit for this IP in the database.
  await db.authRateLimit.upsert(
    where: AuthRateLimitWhereUniqueInput(
      ipAddress: ip,
    ),
    create: AuthRateLimitCreateInput(
      ipAddress: ip,
      attempts: 1,
    ),
    update: const AuthRateLimitUpdateInput(
      attempts: IntFieldUpdateOperationsInput(
        increment: 1,
      ),
    ),
  );
}

/// Determines if an IP address has hit the rate limit for authentication.
Future<bool> isIpRateLimited(RequestContext context) async {
  final ip = context.request.headers['X-Forwarded-For'] ??
      context.request.connectionInfo.remoteAddress.address;

  final limit = await db.authRateLimit.findUnique(
    where: AuthRateLimitWhereUniqueInput(
      ipAddress: ip,
    ),
  );
  if (limit == null) return false;

  // We've hit the rate limit.
  if (limit.attempts >= 5) {
    final now = DateTime.now().toUtc();

    // If the last time the limit was hit is null, set it to now.
    if (limit.lastAttempt == null) {
      await db.authRateLimit.update(
        where: AuthRateLimitWhereUniqueInput(
          ipAddress: ip,
        ),
        data: AuthRateLimitUpdateInput(
          lastAttempt: NullableDateTimeFieldUpdateOperationsInput(
            set: now,
          ),
        ),
      );
    }

    // If the last hit was more than 30 minutes ago, reset the limit.
    final diff = now.difference(limit.lastAttempt ?? now);
    if (diff.inMinutes > 30) {
      await db.authRateLimit.update(
        where: AuthRateLimitWhereUniqueInput(
          ipAddress: ip,
        ),
        data: AuthRateLimitUpdateInput(
          attempts: const IntFieldUpdateOperationsInput(
            set: 1,
          ),
          lastAttempt: NullableDateTimeFieldUpdateOperationsInput(
            set: now,
          ),
        ),
      );
    }
  }

  return limit.lastAttempt != null;
}

/// Reset the rate limit for a given IP address.
Future<void> resetIpRateLimit(RequestContext context) async {
  final ip = context.request.headers['X-Forwarded-For'] ??
      context.request.connectionInfo.remoteAddress.address;

  // Check if we already have a rate limit for this IP in the database.
  // If we do, delete it.
  final record = await db.authRateLimit.findUnique(
    where: AuthRateLimitWhereUniqueInput(
      ipAddress: ip,
    ),
  );

  if (record != null) {
    await db.authRateLimit.delete(
      where: AuthRateLimitWhereUniqueInput(
        ipAddress: ip,
      ),
    );
  }
}

/// Check a request context for a valid bearer token to determine if the
/// request is authenticated.
Future<atp.Session?> sessionFromContext(RequestContext context) async {
  final header = context.request.headers['Authorization'];
  final token = validateBearerToken(header);

  // Either we don't have a token or it's in an invalid format.
  if (token == null) return null;

  // Check if we have a session for the given DID.
  final record = await db.sessionRecord.findUnique(
    where: SessionRecordWhereUniqueInput(did: token.did),
  );

  // If we already have a session then great! Otherwise, try to create one.
  if (record != null) {
    final json = jsonDecode(record.session) as Map<String, dynamic>;
    final session = atp.Session.fromJson(json);

    // Use the stored PDS host for any re-auth against this account.
    final pdsHost = record.pdsUrl;

    final accessJwt =
        JWT.decode(session.accessJwt).payload as Map<String, dynamic>;
    final refreshJwt =
        JWT.decode(session.refreshJwt).payload as Map<String, dynamic>;

    final accessExp = DateTime.fromMillisecondsSinceEpoch(
      (accessJwt['exp'] as int) * 1000,
    );

    final refreshExp = DateTime.fromMillisecondsSinceEpoch(
      (refreshJwt['exp'] as int) * 1000,
    );
    final now = DateTime.now().toUtc();

    // Let's handle token expiration.
    if (now.isAfter(accessExp)) {
      if (now.isAfter(refreshExp)) {
        // Refresh token is expired. We gotta get a brand new session.
        // Check if the IP is rate limited for authentication attempts.
        final isRateLimited = await isIpRateLimited(context);
        if (isRateLimited) return null;

        final newSession = await createBlueskySession(
          identifier: token.identifier,
          appPassword: token.appPassword,
          pdsHost: token.pdsUrl,
        );

        // Credentials are just straight up invalid. Bail.
        if (newSession == null) {
          await incrementFailedAuthAttempt(context);
          return null;
        }

        // Reset the IP rate limit.
        await resetIpRateLimit(context);

        return newSession;
      } else {
        // The access token is expired but we have a valid refresh token.
        // Call refreshSession directly on the correct PDS via HTTP.
        try {
          final refreshUrl = Uri.parse(
            'https://$pdsHost/xrpc/com.atproto.server.refreshSession',
          );
          final refreshResponse = await httpClient.post(
            refreshUrl,
            headers: {'Authorization': 'Bearer ${session.refreshJwt}'},
          );

          if (refreshResponse.statusCode != 200) {
            // Refresh failed — fall back to full re-auth.
            return await createBlueskySession(
              identifier: token.identifier,
              appPassword: token.appPassword,
              pdsHost: pdsHost,
            );
          }

          final refreshJson =
              jsonDecode(refreshResponse.body) as Map<String, dynamic>;
          final refreshedSession = atp.Session.fromJson(refreshJson);

          // Update the session in the database.
          await db.sessionRecord.update(
            where: SessionRecordWhereUniqueInput(
              did: refreshedSession.did,
            ),
            data: SessionRecordUpdateInput(
              session: StringFieldUpdateOperationsInput(
                set: jsonEncode(refreshJson),
              ),
            ),
          );

          return refreshedSession;
        } catch (e) {
          print('Token refresh error: $e');
          return null;
        }
      }
    }

    return session;
  } else {
    // Check if the IP is rate limited for authentication attempts.
    final isRateLimited = await isIpRateLimited(context);
    if (isRateLimited) return null;

    final newSession = await createBlueskySession(
      identifier: token.identifier,
      appPassword: token.appPassword,
      pdsHost: token.pdsUrl,
    );

    // Credentials are just straight up invalid. Bail.
    if (newSession == null) {
      incrementFailedAuthAttempt(context);
      return null;
    }

    // Reset the IP rate limit.
    await resetIpRateLimit(context);

    return newSession;
  }
}

/// Helper function that takes a [RequestContext] and returns user preferences.
SkybridgePreferences preferencesFromContext(RequestContext context) {
  final header = context.request.headers['Authorization'];
  final token = validateBearerToken(header);
  if (token == null) return const SkybridgePreferences();
  return token.preferences;
}

/// Helper function that takes a [RequestContext] and returns an API accessor.
Future<bsky.Bluesky?> blueskyFromContext(RequestContext context) async {
  final session = await sessionFromContext(context);
  if (session == null) return null;
  return bsky.Bluesky.fromSession(session);
}

/// A helper function to return a 401 response for an invalid bearer token.
Response authError() {
  return Response.json(
    statusCode: 401,
    body: {
      'error': 'The access token is invalid',
    },
  );
}

/// Check if [tokenString] is a valid signed bearer token that we can unpack.
OAuthAccessToken? validateBearerToken(String? tokenString) {
  if (tokenString == null) return null;
  if (tokenString.startsWith('Bearer ')) {
    final token = unpackObject(tokenString.substring(7));
    if (token == null) return null;
    return OAuthAccessToken.fromJson(token);
  }
  return null;
}

/// Global list of active sessions.
Map<String, atp.Session> sessions = {};

/// Create a Bluesky session with the given credentials and store
/// it in the database. Uses direct HTTP to the resolved PDS.
Future<atp.Session?> createBlueskySession({
  required String identifier,
  required String appPassword,
  String? pdsHost,
}) async {
  try {
    final resolvedHost = pdsHost ?? await resolvePdsHost(identifier);
    print('Creating session for $identifier on PDS: $resolvedHost');

    final url = Uri.parse(
      'https://$resolvedHost/xrpc/com.atproto.server.createSession',
    );
    final response = await httpClient.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'identifier': identifier, 'password': appPassword}),
    );

    if (response.statusCode != 200) {
      print('createSession HTTP ${response.statusCode}: ${response.body}');
      return null;
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final session = atp.Session.fromJson(json);

    await db.sessionRecord.upsert(
      where: SessionRecordWhereUniqueInput(did: session.did),
      create: SessionRecordCreateInput(
        did: session.did,
        session: jsonEncode(json),
        pdsUrl: resolvedHost,
      ),
      update: SessionRecordUpdateInput(
        session: StringFieldUpdateOperationsInput(set: jsonEncode(json)),
        pdsUrl: StringFieldUpdateOperationsInput(set: resolvedHost),
      ),
    );
    print('New session created for ${session.did}');
    return session;
  } catch (e) {
    print('createBlueskySession error: $e');
    return null;
  }
}
