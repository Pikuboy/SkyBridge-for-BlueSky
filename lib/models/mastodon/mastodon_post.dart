import 'package:atproto/core.dart' as atp;
import 'package:atproto/core.dart';
import 'package:bluesky/app_bsky_embed_images.dart';
import 'package:bluesky/app_bsky_embed_record.dart';
import 'package:bluesky/app_bsky_embed_recordwithmedia.dart';
import 'package:bluesky/app_bsky_feed_defs.dart';
import 'package:bluesky/src/services/codegen/app/bsky/feed/post/main.dart' show FeedPostRecord;
import 'package:bluesky/bluesky.dart' as bsky;
import 'package:bluesky/com_atproto_repo_strongref.dart' show RepoStrongRef;
import 'package:bluesky_text/bluesky_text.dart';
import 'package:collection/collection.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import 'package:json_annotation/json_annotation.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/facets.dart';
import 'package:sky_bridge/models/mastodon/mastodon_account.dart';
import 'package:sky_bridge/models/mastodon/mastodon_card.dart';
import 'package:sky_bridge/models/mastodon/mastodon_media_attachment.dart';
import 'package:sky_bridge/models/mastodon/mastodon_mention.dart';
import 'package:sky_bridge/models/mastodon/mastodon_tag.dart';
import 'package:sky_bridge/src/generated/prisma/client.dart';
import 'package:sky_bridge/src/generated/prisma/prisma.dart';
import 'package:sky_bridge/src/generated/prisma/model.dart';
import 'package:orm/orm.dart';
import 'package:sky_bridge/util.dart';

part 'mastodon_post.g.dart';

/// Representation for a Mastodon status.
@JsonSerializable()
@CopyWith()
class MastodonPost {
  /// Constructs an instance of [MastodonPost].
  MastodonPost({
    required this.id,
    required this.createdAt,
    required this.sensitive,
    required this.spoilerText,
    required this.visibility,
    required this.uri,
    required this.repliesCount,
    required this.reblogsCount,
    required this.favouritesCount,
    required this.content,
    required this.account,
    required this.mediaAttachments,
    required this.mentions,
    required this.tags,
    required this.emojis,
    required this.application,
    required this.filtered,
    this.inReplyToId,
    this.inReplyToAccountId,
    this.language,
    this.url,
    this.favourited,
    this.reblogged,
    this.muted,
    this.bookmarked,
    this.reblog,
    this.card,
    this.poll,
    this.quote,
    this.text,
    this.editedAt,
    this.pinned,
    this.replyPostUri,
    this.bskyUri,
  });

  /// Converts JSON into a [MastodonPost] instance.
  factory MastodonPost.fromJson(Map<String, dynamic> json) =>
      _$MastodonPostFromJson(json);

  /// Converts the [MastodonPost] to JSON.
  Map<String, dynamic> toJson() => _$MastodonPostToJson(this);

  /// Converts a [bsky.FeedView] to a [MastodonPost].
  static Future<MastodonPost> fromFeedView(FeedViewPost view) async {
    final post = view.post;

    // Determine if this is a repost.
    final repost = view.reason?.when(
      reasonRepost: (repost) => repost,
      reasonPin: (_) => null,
      unknown: (_) => null,
    );
    final isRepost = repost != null;

    // Process facets such as mentions and links.
    // In bluesky 1.x, post.record is Map<String,dynamic> and must be decoded.
    final postRecord = FeedPostRecord.fromJson(
      post.record as Map<String, dynamic>,
    );
    final processed = await processFacets(
      postRecord.facets ?? [],
      postRecord.text,
    );

    // Bit of a mess right now, could use some cleaning up...
    MastodonAccount account;
    var id = (await postToDatabase(post)).id;
    var content = processed.htmlText;
    var text = postRecord.text;
    var likeCount = post.likeCount ?? 0;
    var repostCount = post.repostCount ?? 0;
    var replyCount = post.replyCount ?? 0;
    final mediaAttachments = <MastodonMediaAttachment>[];
    String? language = postRecord.langs?.firstOrNull ?? 'en';

    final baseUrl = env.getOrElse(
      'SKYBRIDGE_BASEURL',
      () => throw Exception('SKYBRIDGE_BASEURL not set!'),
    );

    // Handle embedded content.
    final embed = post.embed;

    // DEBUG: log raw embed JSON to help diagnose media+quote display issues.
    if (embed != null) {
      try {
        final recordMap = post.record as Map<String, dynamic>;
        print('[DEBUG fromFeedView] uri=${post.uri} embed_type=${embed.data.runtimeType} record=$recordMap');
      } catch (e) {
        print('[DEBUG fromFeedView] could not log embed: $e');
      }
    }
    if (embed != null) {
      if (embed.data is EmbedImagesView) {
        final embedded = embed.data as EmbedImagesView;

        // Add the images to the list of media attachments.
        for (final image in embedded.images) {
          final attachment = MastodonMediaAttachment.fromEmbed(image);
          mediaAttachments.add(attachment);
        }
      } else if (embed.data is EmbedRecordWithMediaView) {
        final embedded = embed.data as EmbedRecordWithMediaView;

        // When there are other types of embeds, we need to grab the
        // images with EmbedViewRecordWithMedia.
        embedded.media.whenOrNull(
          embedImagesView: (media) {
            for (final image in media.images) {
              final attachment = MastodonMediaAttachment.fromEmbed(image);
              mediaAttachments.add(attachment);
            }
          },
        );
      } else {
        // Handle video embeds (app.bsky.embed.video#view) and any other
        // embed types via the .when() union accessor.
        // whenOrNull does not support async callbacks, so we extract the
        // video data first and await outside the callback.
        dynamic videoEmbedData;
        embed.whenOrNull(
          embedVideoView: (videoEmbed) {
            videoEmbedData = videoEmbed;
          },
        );
        if (videoEmbedData != null) {
          final attachment = await MastodonMediaAttachment.fromVideoEmbed(
            videoEmbedData,
            baseUrl: baseUrl,
          );
          if (attachment != null) mediaAttachments.add(attachment);
        }
        
      // Détecter les GIFs externes (Tenor/Klipy)
        dynamic externalEmbedData;
        embed.whenOrNull(
          embedExternalView: (externalEmbed) {
            print('[GIF] embedExternalView detected in fromFeedView');
            externalEmbedData = externalEmbed;
          },
        );
        if (externalEmbedData != null) {
          final gifAttachment = _gifAttachmentFromExternal(externalEmbedData);
          if (gifAttachment != null) {
            print('[GIF] gifAttachment added: ${gifAttachment.url}');
            mediaAttachments.add(gifAttachment);
          }
        } else {
          print('[GIF] no externalEmbedData found — embed type: ${embed.runtimeType}');
        }
      }
    }

    // Handle app.bsky.embed.gallery

    // Handle app.bsky.embed.gallery (new embed type, not yet in Dart SDK).
    // We read it directly from the raw JSON of the post record and embed.
    if (mediaAttachments.isEmpty) {
      final galleryAttachments = _extractGalleryAttachments(post.record, post.embed);
      mediaAttachments.addAll(galleryAttachments);
    }

    if (isRepost) {
      // Clear out the content, since this is a repost.
      content = '';
      text = '';
      likeCount = 0;
      repostCount = 0;
      replyCount = 0;
      language = null;
      mediaAttachments.clear();

      // Since this is a repost, we need to assign a unique ID and get
      // the account that reposted it.
      id = (await repostToDatabase(view)).id;

      account = await MastodonAccount.fromActorBasic(repost.by);
    } else {
      account = await MastodonAccount.fromActorBasic(post.author);
    }

    // Construct URL/URI
    // will need to change this when federation is a thing probably?
    final postId = post.uri.toString().split('/').last;
    const base = 'https://bsky.app';
    final url = '$base/profile/${account.username}/post/$postId';

    var card = await MastodonCard.fromEmbed(post.embed);

    // Determine early if this is a quote+media post.
    final isRecordWithMedia = embed?.data is EmbedRecordWithMediaView;

    // Build a native Mastodon quote object if this is a quote post.
    Map<String, dynamic>? quote;
    if (card != null && card.url.contains(baseUrl)) {
      // Extract media and card from the quoted post's embeds if available.
      final quotedMediaAttachments = <Map<String, dynamic>>[];
      Map<String, dynamic>? quotedCard;

      void extractQuotedImages(List<UEmbedRecordViewRecordEmbeds>? embeds) {
        if (embeds == null || embeds.isEmpty) return;
        for (final quotedEmbed in embeds) {
          switch (quotedEmbed) {
            case UEmbedRecordViewRecordEmbedsEmbedImagesView(:final data):
              for (final image in data.images) {
                quotedMediaAttachments.add(
                  MastodonMediaAttachment.fromEmbed(image, useThumbnail: true).toJson(),
                );
              }
            case UEmbedRecordViewRecordEmbedsEmbedRecordWithMediaView(:final data):
              switch (data.media) {
                case UEmbedRecordWithMediaViewMediaEmbedImagesView(:final data):
                  for (final image in data.images) {
                    quotedMediaAttachments.add(
                      MastodonMediaAttachment.fromEmbed(image, useThumbnail: true).toJson(),
                    );
                  }
                default:
                  break;
              }
            default:
              break;
          }
        }
      }

      Future<void> extractQuotedCard(List<UEmbedRecordViewRecordEmbeds>? embeds) async {
        if (embeds == null || embeds.isEmpty || quotedCard != null) return;
        for (final quotedEmbed in embeds) {
          switch (quotedEmbed) {
            case UEmbedRecordViewRecordEmbedsEmbedExternalView(:final data):
              final cardObj = await MastodonCard.fromEmbed(
                UPostViewEmbed.embedExternalView(data: data)
              );
              if (cardObj != null) {
                quotedCard = cardObj.toJson();
              }
              return;
            case UEmbedRecordViewRecordEmbedsEmbedVideoView(:final data):
              // Vidéos non supportées
            default:
              break;
          }
        }
      }


      if (embed != null) {
        switch (embed) {
          case UPostViewEmbedEmbedRecordView(:final data):
            switch (data.record) {
              case UEmbedRecordViewRecordEmbedRecordViewRecord(:final data):
                extractQuotedImages(data.embeds);
                await extractQuotedCard(data.embeds);
              default:
                break;
            }
          case UPostViewEmbedEmbedRecordWithMediaView(:final data):
            switch (data.record.record) {
              case UEmbedRecordViewRecordEmbedRecordViewRecord(:final data):
                extractQuotedImages(data.embeds);
                await extractQuotedCard(data.embeds);
              default:
                break;
            }
          default:
            break;
        }
      }
      
      // Choose between card (old system) or quoted_status (new system).
      // Use the native quote system if:
      //   - the quoted post has media, OR
      //   - the main post itself is a media+quote embed (EmbedRecordWithMediaView),
      //     even when the quoted post has no media (fixes image+quote with text-only quote).
      if (quotedMediaAttachments.isEmpty && !isRecordWithMedia && mediaAttachments.isEmpty) {
        // No media anywhere relevant → use old card system (works for plain links)
        // Keep the card, don't create quote object
        print('[DEBUG] Quote has no media and post is not record-with-media, using card system');
      } else {
        // Has media in quoted post OR main post is media+quote → use new quoted_status system
        print('[DEBUG] Using quoted_status system (quotedMedia=${quotedMediaAttachments.length}, isRecordWithMedia=$isRecordWithMedia)');
        quote = {
          'state': 'accepted',
          'quoted_status': {
            'id': card.url.split('/').last,
            'created_at': post.indexedAt.toUtc().toIso8601String(),
            'sensitive': false,
            'spoiler_text': '',
            'visibility': 'public',
            'uri': card.url,
            'url': card.url,
            'replies_count': 0,
            'reblogs_count': 0,
            'favourites_count': 0,
            'content': '<p>${card.description}</p>',
            'reblog': null,
            'account': {
              'id': card.url.split('/').last,
              'username': card.authorName,
              'acct': card.authorName,
              'display_name': card.authorName,
              'locked': false,
              'bot': false,
              'created_at': '2020-01-01T00:00:00.000Z',
              'note': '',
              'url': 'https://$baseUrl/@${card.authorName}',
              'avatar': card.authorUrl.isNotEmpty ? card.authorUrl : 'https://$baseUrl/1px.png',
              'avatar_static': card.authorUrl.isNotEmpty ? card.authorUrl : 'https://$baseUrl/1px.png',
              'header': 'https://$baseUrl/1px.png',
              'header_static': 'https://$baseUrl/1px.png',
              'followers_count': 0,
              'following_count': 0,
              'statuses_count': 0,
              'emojis': [],
              'fields': [],
            },
            'media_attachments': quotedMediaAttachments,
            'mentions': [],
            'tags': [],
            'emojis': [],
            'card': quotedCard,
            'poll': null,
          },
        };
        // Don't use card hack for quote posts — use native quote field instead.
        card = null;
      }
    }

    // If there is an external card link not already in content, add it.
    if (card != null) {
      final cardUrlNormalized = card.url.toLowerCase();
      final alreadyInText = text.toLowerCase().contains(cardUrlNormalized);
      final alreadyInContent = content.toLowerCase().contains(cardUrlNormalized);
      if (!alreadyInText && !alreadyInContent) {
        content +=
        '\n\n<a href="${card.url}" rel="nofollow noopener noreferrer" target="_blank">${card.url}</a>';
      }
    }

    // Drop external link cards when media is present.
    if (mediaAttachments.isNotEmpty && card != null && !card.url.contains(baseUrl)) {
      card = null;
    }

    // Map hashtags included in the text to Mastodon tags.
    final tags = BlueskyText(content)
        .tags
        .map(
          (tag) => MastodonTag(
            name: tag.value,
            url: '$baseUrl/tags/${tag.value}',
          ),
        )
        .toList();

    // First, take the labels and remove duplicate values.
    final labelValues = post.labels?.map((label) => label.val).toSet();

    // Then all the labels, capitalize the first letter, and join them
    // with a comma.
    final labels = labelValues?.map((l) => toBeginningOfSentenceCase(l) ?? l).join(', ');

    // Add a 'CW:' prefix to the labels string.
    final labelsString = labels != null && labels.isNotEmpty
        ? 'CW: $labels'
        : null;

    return MastodonPost(
      id: id.toString(),
      createdAt: post.indexedAt.toUtc(),
      sensitive: post.labels?.isNotEmpty ?? false,
      spoilerText: labelsString ?? '',
      visibility: PostVisibility.public,
      language: language,
      uri: url,
      url: url,
      repliesCount: replyCount,
      reblogsCount: repostCount,
      favouritesCount: likeCount,
      favourited: post.viewer?.like != null,
      reblogged: post.viewer?.repost != null,
      muted: false,
      bookmarked: false,
      content: '<p>$content</p>',
      text: text,
      reblog: isRepost ? await MastodonPost.fromBlueSkyPost(view.post) : null,
      application: {
        'name': 'Bluesky',
        'website': 'https://bsky.app',
      },
      account: account,
      mediaAttachments: mediaAttachments,
      mentions: processed.mentions,
      tags: tags,
      emojis: [],
      pinned: false,
      filtered: [],
      card: card,
      quote: quote,
      replyPostUri: postRecord.reply?.parent.uri,
      bskyUri: view.post.uri,
    );
  }

  /// Converts a BlueSky post to a [MastodonPost].
  static Future<MastodonPost> fromBlueSkyPost(PostView post) async {
    final mediaAttachments = <MastodonMediaAttachment>[];
    final account = await MastodonAccount.fromActorBasic(post.author);

    final baseUrl = env.getOrElse(
      'SKYBRIDGE_BASEURL',
      () => throw Exception('SKYBRIDGE_BASEURL not set!'),
    );

    // Handle embedded content.
    final embed = post.embed;

    // DEBUG: log raw embed JSON to help diagnose media+quote display issues.
    if (embed != null) {
      try {
        final recordMap = post.record as Map<String, dynamic>;
        print('[DEBUG fromBlueSkyPost] uri=${post.uri} embed_type=${embed.data.runtimeType} record=$recordMap');
      } catch (e) {
        print('[DEBUG fromBlueSkyPost] could not log embed: $e');
      }
    }
    if (embed != null) {
      if (embed.data is EmbedImagesView) {
        final embedded = embed.data as EmbedImagesView;

        // Add the images to the list of media attachments.
        for (final image in embedded.images) {
          final attachment = MastodonMediaAttachment.fromEmbed(image);
          mediaAttachments.add(attachment);
        }
      } else if (embed.data is EmbedRecordWithMediaView) {
        final embedded = embed.data as EmbedRecordWithMediaView;

        // When there are other types of embeds, we need to grab the
        // images with EmbedViewRecordWithMedia.
        embedded.media.whenOrNull(
          embedImagesView: (media) {
            for (final image in media.images) {
              final attachment = MastodonMediaAttachment.fromEmbed(image);
              mediaAttachments.add(attachment);
            }
          },
        );
      } else {
        // Handle video embeds (app.bsky.embed.video#view) and any other
        // embed types via the .when() union accessor.
        // whenOrNull does not support async callbacks, so we extract the
        // video data first and await outside the callback.
        dynamic videoEmbedData;
        embed.whenOrNull(
          embedVideoView: (videoEmbed) {
            videoEmbedData = videoEmbed;
          },
        );
        if (videoEmbedData != null) {
          final attachment = await MastodonMediaAttachment.fromVideoEmbed(
            videoEmbedData,
            baseUrl: baseUrl,
          );
          if (attachment != null) mediaAttachments.add(attachment);
        }

        // Détecter les GIFs externes (Tenor/Klipy)
        dynamic externalEmbedData;
        embed.whenOrNull(
          embedExternalView: (externalEmbed) {
            print('[GIF] embedExternalView detected in fromFeedView');
            externalEmbedData = externalEmbed;
          },
        );
        if (externalEmbedData != null) {
          final gifAttachment = _gifAttachmentFromExternal(externalEmbedData);
          if (gifAttachment != null) {
            print('[GIF] gifAttachment added: ${gifAttachment.url}');
            mediaAttachments.add(gifAttachment);
          }
        } else {
          print('[GIF] no externalEmbedData found — embed type: ${embed.runtimeType}');
        }
      }
    }

      // Handle app.bsky.embed.gallery (new embed type, not yet in Dart SDK).
      // We read it directly from the raw JSON of the post record and embed.
      if (mediaAttachments.isEmpty) {
      final galleryAttachments = _extractGalleryAttachments(post.record, post.embed);
      mediaAttachments.addAll(galleryAttachments);
    }

    // Process facets such as mentions and links.
    // In bluesky 1.x, post.record is Map<String,dynamic> and must be decoded.
    final postRecord = FeedPostRecord.fromJson(
      post.record as Map<String, dynamic>,
    );
    final processed = await processFacets(
      postRecord.facets ?? [],
      postRecord.text,
    );

    // Construct URL/URI
    // will need to change this when federation is a thing probably?
    final postId = post.uri.toString().split('/').last;
    const base = 'https://bsky.app';
    final url = '$base/profile/${account.username}/post/$postId';

    var content = processed.htmlText;
    final text = postRecord.text;

    var card = await MastodonCard.fromEmbed(post.embed);

    // Determine early if this is a quote+media post, so we can avoid
    // appending the card URL/description to the content (it would be
    // shown twice: once in content, once in the card itself).
    final isRecordWithMedia = embed?.data is EmbedRecordWithMediaView;

    // Build a native Mastodon quote object if this is a quote post.
    Map<String, dynamic>? quote;
    if (card != null && card.url.contains(baseUrl)) {
      final quotedMediaAttachments = <Map<String, dynamic>>[];
      Map<String, dynamic>? quotedCard;

      void extractQuotedImages(List<UEmbedRecordViewRecordEmbeds>? embeds) {
        if (embeds == null || embeds.isEmpty) return;
        for (final quotedEmbed in embeds) {
          switch (quotedEmbed) {
            case UEmbedRecordViewRecordEmbedsEmbedImagesView(:final data):
              for (final image in data.images) {
                quotedMediaAttachments.add(
                  MastodonMediaAttachment.fromEmbed(image, useThumbnail: true).toJson(),
                );
              }
            case UEmbedRecordViewRecordEmbedsEmbedRecordWithMediaView(:final data):
              switch (data.media) {
                case UEmbedRecordWithMediaViewMediaEmbedImagesView(:final data):
                  for (final image in data.images) {
                    quotedMediaAttachments.add(
                      MastodonMediaAttachment.fromEmbed(image, useThumbnail: true).toJson(),
                    );
                  }
                default:
                  break;
              }
            default:
              break;
          }
        }
      }

      Future<void> extractQuotedCard(List<UEmbedRecordViewRecordEmbeds>? embeds) async {
        if (embeds == null || embeds.isEmpty || quotedCard != null) return;
        for (final quotedEmbed in embeds) {
          switch (quotedEmbed) {
            case UEmbedRecordViewRecordEmbedsEmbedExternalView(:final data):
              final cardObj = await MastodonCard.fromEmbed(
                UPostViewEmbed.embedExternalView(data: data)
              );
              if (cardObj != null) {
                quotedCard = cardObj.toJson();
              }
              return;
            case UEmbedRecordViewRecordEmbedsEmbedVideoView(:final data):
              // Vidéos non supportées
            default:
              break;
          }
        }
      }


      if (embed != null) {
        switch (embed) {
          case UPostViewEmbedEmbedRecordView(:final data):
            switch (data.record) {
              case UEmbedRecordViewRecordEmbedRecordViewRecord(:final data):
                extractQuotedImages(data.embeds);
                await extractQuotedCard(data.embeds);
              default:
                break;
            }
          case UPostViewEmbedEmbedRecordWithMediaView(:final data):
            switch (data.record.record) {
              case UEmbedRecordViewRecordEmbedRecordViewRecord(:final data):
                extractQuotedImages(data.embeds);
                await extractQuotedCard(data.embeds);
              default:
                break;
            }
          default:
            break;
        }
      }

      // Choose between card (old system) or quoted_status (new system).
      // Use the native quote system if:
      //   - the quoted post has media, OR
      //   - the main post itself is a media+quote embed (EmbedRecordWithMediaView),
      //     even when the quoted post has no media (fixes image+quote with text-only quote).
      if (quotedMediaAttachments.isEmpty && !isRecordWithMedia && mediaAttachments.isEmpty) {
        // No media anywhere relevant → use old card system (works for plain links)
        // Keep the card, don't create quote object
        print('[DEBUG] Quote has no media and post is not record-with-media, using card system');
      } else {
        // Has media in quoted post OR main post is media+quote → use new quoted_status system
        print('[DEBUG] Using quoted_status system (quotedMedia=${quotedMediaAttachments.length}, isRecordWithMedia=$isRecordWithMedia)');
        quote = {
          'state': 'accepted',
          'quoted_status': {
            'id': card.url.split('/').last,
            'created_at': post.indexedAt.toUtc().toIso8601String(),
            'sensitive': false,
            'spoiler_text': '',
            'visibility': 'public',
            'uri': card.url,
            'url': card.url,
            'replies_count': 0,
            'reblogs_count': 0,
            'favourites_count': 0,
            'content': '<p>${card.description}</p>',
            'reblog': null,
            'account': {
              'id': card.url.split('/').last,
              'username': card.authorName,
              'acct': card.authorName,
              'display_name': card.authorName,
              'locked': false,
              'bot': false,
              'created_at': '2020-01-01T00:00:00.000Z',
              'note': '',
              'url': 'https://$baseUrl/@${card.authorName}',
              'avatar': card.authorUrl.isNotEmpty ? card.authorUrl : 'https://$baseUrl/1px.png',
              'avatar_static': card.authorUrl.isNotEmpty ? card.authorUrl : 'https://$baseUrl/1px.png',
              'header': 'https://$baseUrl/1px.png',
              'header_static': 'https://$baseUrl/1px.png',
              'followers_count': 0,
              'following_count': 0,
              'statuses_count': 0,
              'emojis': [],
              'fields': [],
            },
            'media_attachments': quotedMediaAttachments,
            'mentions': [],
            'tags': [],
            'emojis': [],
            'card': quotedCard,
            'poll': null,
          },
        };
        // Don't use card hack for quote posts with media — use native quote field instead.
        card = null;
      }
    }

    // If there is an external card link not already in content, add it.
    if (card != null) {
      final cardUrlNormalized = card.url.toLowerCase();
      final alreadyInText = text.toLowerCase().contains(cardUrlNormalized);
      final alreadyInContent = content.toLowerCase().contains(cardUrlNormalized);
      if (!alreadyInText && !alreadyInContent) {
        content +=
            '\n\n<a href="${card.url}" rel="nofollow noopener noreferrer" target="_blank">${card.url}</a>';
      }
    }

    // Drop external link cards when media is present.
    if (mediaAttachments.isNotEmpty && card != null && !card.url.contains(baseUrl)) {
      card = null;
    }

    // Map hashtags included in the text to Mastodon tags.
    final tags = BlueskyText(content)
        .tags
        .map(
          (tag) => MastodonTag(
            name: tag.value,
            url: '$baseUrl/tags/${tag.value}',
          ),
        )
        .toList();

    // First, take the labels and remove duplicate values.
    final labelValues = post.labels?.map((label) => label.val).toSet();

    // Then all the labels, capitalize the first letter, and join them
    // with a comma.
    final labels = labelValues?.map((l) => toBeginningOfSentenceCase(l) ?? l).join(', ');

    // Add a 'CW:' prefix to the labels string.
    final labelsString = labels != null && labels.isNotEmpty
        ? 'CW: $labels'
        : null;

    return MastodonPost(
      id: (await postToDatabase(post)).id.toString(),
      createdAt: post.indexedAt.toUtc(),
      sensitive: post.labels?.isNotEmpty ?? false,
      spoilerText: labelsString ?? '',
      visibility: PostVisibility.public,
      language: postRecord.langs?.firstOrNull ?? 'en',
      uri: url,
      url: url,
      repliesCount: post.replyCount ?? 0,
      reblogsCount: post.repostCount ?? 0,
      favouritesCount: post.likeCount ?? 0,
      favourited: post.viewer?.like != null,
      reblogged: post.viewer?.repost != null,
      muted: false,
      bookmarked: false,
      content: '<p>$content</p>',
      text: text,
      application: {
        'name': 'Bluesky',
        'website': 'https://bsky.app',
      },
      account: account,
      mediaAttachments: mediaAttachments,
      mentions: processed.mentions,
      tags: tags,
      emojis: [],
      pinned: false,
      filtered: [],
      card: card,
      quote: quote,
      replyPostUri: postRecord.reply?.parent.uri,
      bskyUri: post.uri,
    );
  }

  /// Uses the current user session to repost this [MastodonPost].
  Future<MastodonPost?> repost(bsky.Bluesky bluesky) async {
    // Convert the string ID to an int and get the record for the post.
    final intId = BigInt.parse(id);
    final postRecord = await db.postRecord.findUnique(
      where: PostRecordWhereUniqueInput(id: intId),
    );

    if (postRecord != null) {
      late RepostRecord repostRecord;
      final createdAt = DateTime.now().toUtc();

      // Create the repost record via Bluesky feed service.
      // In bluesky 1.x, the API is bluesky.feed.repost.create(subject: ...)
      await bluesky.feed.repost.create(
        subject: RepoStrongRef(
          cid: postRecord.cid!,
          uri: atp.AtUri.parse(postRecord.uri!),
        ),
      );

      // Write the repost to the database.
      await databaseTransaction(() async {
        repostRecord = await postRecord.repost(createdAt, postRecord.authorDid!);
      });

      final repost = copyWith(
        id: repostRecord.id.toString(),
        content: '',
        text: '',
        favouritesCount: 0,
        reblogsCount: 0,
        repliesCount: 0,
        reblog: this,
        reblogged: true,
        createdAt: createdAt,
      )..reblogsCount += 1;

      return repost;
    }
    return null;
  }

  /// The ID of the post. Is a 64-bit integer cast to a string.
  final String id;

  /// URI of the status used for federation.
  final String uri;

  /// The date when this post was created.
  @JsonKey(
    name: 'created_at',
    fromJson: dateTimeFromISO8601,
    toJson: dateTimeToISO8601,
  )
  final DateTime createdAt;

  /// The account that authored this post.
  final MastodonAccount account;

  /// HTML-encoded post content.
  final String content;

  /// Visibility of this post.
  final PostVisibility visibility;

  /// Whether this post is marked as sensitive.
  final bool sensitive;

  /// Subject or summary line, below which post content is collapsed
  /// until expanded.
  @JsonKey(name: 'spoiler_text')
  final String spoilerText;

  /// Media that is attached to this post.
  @JsonKey(name: 'media_attachments')
  final List<MastodonMediaAttachment> mediaAttachments;

  /// The application used to create this post.
  final Map<String, String?> application;

  /// Mentions of users within the post content.
  final List<MastodonMention> mentions;

  /// Hashtags used within the post content.
  /// Bluesky has no concept of hashtags at the moment so this is always empty.
  final List<MastodonTag> tags;

  /// Custom emoji to be used when rendering the post content.
  final List<Map<String, dynamic>> emojis;

  /// How many reposts this post has received.
  @JsonKey(name: 'reblogs_count')
  int reblogsCount;

  /// How many likes this post has received.
  @JsonKey(name: 'favourites_count')
  int favouritesCount;

  /// How many replies this post has received.
  @JsonKey(name: 'replies_count')
  final int repliesCount;

  /// A link to the post's HTML representation.
  final String? url;

  /// The ID of the post this post is a reply to.
  @JsonKey(name: 'in_reply_to_id')
  String? inReplyToId;

  /// The 64-bit ID of the account this post is a reply to.
  @JsonKey(name: 'in_reply_to_account_id')
  String? inReplyToAccountId;

  /// The post being reblogged.
  final MastodonPost? reblog;

  /// The poll attached to this post.
  final Map<String, dynamic>? poll;

  /// Preview card for links included in the post content.
  final MastodonCard? card;

  /// Quote post attached to this post (Mastodon 4.4+).
  final Map<String, dynamic>? quote;

  /// Primary language of this post.
  final String? language;

  /// Plain-text source of a status. Returned instead of content when status
  /// is deleted, so the user may redraft from the source text without the
  /// client having to reverse-engineer the original text from the HTML content.
  final String? text;

  /// Timestamp of when the post was last edited.
  @JsonKey(
    name: 'edited_at',
    fromJson: dateTimeFromNullableISO8601,
    toJson: dateTimeToISO8601,
  )
  final DateTime? editedAt;

  /// Whether the current user has liked this post.
  bool? favourited;

  /// Whether the current user has reblogged this post.
  bool? reblogged;

  /// Whether the current user h§as muted notifications for this post.
  final bool? muted;

  /// Whether the current user has bookmarked this post.
  final bool? bookmarked;

  /// Whether this post is pinned by the current user.
  final bool? pinned;

  /// The filter and keywords used to match this post by the current user.
  final List<String> filtered;

  /// The bluesky URI of this post.
  /// Is not included in the JSON representation of a post, only used
  /// internally.
  @JsonKey(includeFromJson: false, includeToJson: false)
  final atp.AtUri? bskyUri;

  /// The bluesky URI of the post this post is a reply to.
  /// Is not included in the JSON representation of a post, only used
  /// internally for [processParentPosts].
  @JsonKey(includeFromJson: false, includeToJson: false)
  final atp.AtUri? replyPostUri;
}

/// Convertit un embed externe GIF (Tenor/Klipy/Giphy) en media_attachment gifv.
/// Retourne null si l'URL ne ressemble pas à un GIF animé.
MastodonMediaAttachment? _gifAttachmentFromExternal(dynamic externalEmbed) {
  try {
    final json = (externalEmbed as dynamic).toJson() as Map<String, dynamic>;
    print('[GIF] toJson result: $json');

    final external = json['external'] as Map<String, dynamic>?;
    if (external == null) {
      print('[GIF] No "external" key found in json');
      return null;
    }

    final uri = external['uri'] as String? ?? '';
    final thumb = external['thumb'] as String? ?? '';
    final title = external['title'] as String? ?? '';
    final description = external['description'] as String? ?? '';
    print('[GIF] uri=$uri thumb=$thumb title=$title');

    final gifHosts = [
      'tenor.com', 'media.tenor.com',
      'klipy.com', 'static.klipy.com',
      'giphy.com', 'media.giphy.com',
      'media0.giphy.com', 'media1.giphy.com',
      'media2.giphy.com', 'media3.giphy.com',
      'media4.giphy.com',
    ];
    final isGifHost = gifHosts.any((host) => uri.contains(host));
    final hasGifParam = uri.contains('.gif') || uri.contains('mp4=') || uri.contains('webm=');
    print('[GIF] isGifHost=$isGifHost hasGifParam=$hasGifParam');

    if (!isGifHost && !hasGifParam) {
      print('[GIF] Not a GIF URL, skipping');
      return null;
    }
// Extraire l'URL MP4 depuis le query param (format Klipy/Tenor)
    // ex: https://static.klipy.com/.../GR40H6n7.gif?hh=304&ww=380&mp4=7lISFKaxghTZkXvZL
    // → https://static.klipy.com/.../7lISFKaxghTZkXvZL.mp4
    String gifUrl = uri;
    try {
      final parsed = Uri.parse(uri);
      final mp4Param = parsed.queryParameters['mp4'];
      if (mp4Param != null && mp4Param.isNotEmpty) {
        // Reconstruire l'URL : même host + même dossier + nom du mp4
        final pathDir = parsed.path.substring(0, parsed.path.lastIndexOf('/') + 1);
        gifUrl = '${parsed.scheme}://${parsed.host}$pathDir$mp4Param.mp4';
        print('[GIF] Extracted MP4 url: $gifUrl');
      }
    } catch (e) {
      print('[GIF] Could not extract MP4 url: $e');
    }

    print('[GIF] Creating gifv attachment for url=$gifUrl');
final ww = int.tryParse(Uri.parse(uri).queryParameters['ww'] ?? '') ?? 380;
final hh = int.tryParse(Uri.parse(uri).queryParameters['hh'] ?? '') ?? 304;
    return MastodonMediaAttachment(
      id: uri.hashCode.abs().toString(),
      type: MediaType.gifv,
      url: gifUrl,        // MP4 pour Ivory
      previewUrl: thumb,
      remoteUrl: uri,     // URL originale en référence
      description: description.isNotEmpty ? description : (title.isNotEmpty ? title : null),
      blurhash: '0',
      meta: MediaAttachmentMetadata(
      original: Metadata(width: ww, height: hh),
),
    );
  } catch (e, stack) {
    print('[GIF] Error extracting external GIF embed: $e');
    print('[GIF] Stack: $stack');
    return null;
  }
}
/// Extracts media attachments from an `app.bsky.embed.gallery` embed.
///
/// This embed type was introduced by Bluesky in June 2026 to support posts
/// with 5–10 images. It is not yet part of the Dart ATProto SDK, so we parse
/// the raw JSON directly from the post record and the view embed.
///
/// The view embed (`post.embed`) carries the CDN URLs we need:
/// ```json
/// {
///   "$type": "app.bsky.embed.gallery#view",
///   "items": [
///     {
///       "$type": "app.bsky.embed.gallery#viewImage",
///       "thumbnail": "https://cdn.bsky.app/img/feed_thumbnail/...",
///       "fullsize":  "https://cdn.bsky.app/img/feed_fullsize/...",
///       "alt": "...",
///       "aspectRatio": { "width": 1000, "height": 1000 }
///     },
///     ...
///   ]
/// }
/// ```
List<MastodonMediaAttachment> _extractGalleryAttachments(
  dynamic record,
  dynamic embedView,
) {
  try {
    // First try to read from the view embed (has CDN URLs).
    if (embedView != null) {
      final embedMap = embedView is Map<String, dynamic>
          ? embedView
          : _tryToJson(embedView);

      if (embedMap != null) {
        final type = embedMap['\$type'] as String?;
        if (type == 'app.bsky.embed.gallery#view') {
          return _parseGalleryViewItems(embedMap);
        }
      }
    }

    // Fallback: parse from the raw record embed (no CDN URLs, but has blob refs).
    if (record is Map<String, dynamic>) {
      final recordEmbed = record['embed'] as Map<String, dynamic>?;
      if (recordEmbed != null) {
        final type = recordEmbed['\$type'] as String?;
        if (type == 'app.bsky.embed.gallery') {
          // No CDN URL available here; skip (the view embed is always preferred).
          print('[Gallery] Record embed found but no view embed — skipping');
        }
      }
    }
  } catch (e) {
    print('[Gallery] Error extracting gallery attachments: $e');
  }
  return [];
}

/// Parses items from an `app.bsky.embed.gallery#view` map.
List<MastodonMediaAttachment> _parseGalleryViewItems(
  Map<String, dynamic> embedMap,
) {
  final attachments = <MastodonMediaAttachment>[];
  final items = embedMap['items'];
  if (items is! List) return attachments;

  for (final item in items) {
    if (item is! Map<String, dynamic>) continue;
    final itemType = item['\$type'] as String?;
    if (itemType != 'app.bsky.embed.gallery#viewImage') continue;

    final fullsize  = item['fullsize']  as String?;
    final thumbnail = item['thumbnail'] as String?;
    final alt       = item['alt']       as String? ?? '';

    if (fullsize == null && thumbnail == null) continue;

    int? width;
    int? height;
    final aspectRatio = item['aspectRatio'];
    if (aspectRatio is Map<String, dynamic>) {
      width  = (aspectRatio['width']  as num?)?.toInt();
      height = (aspectRatio['height'] as num?)?.toInt();
    }

    attachments.add(
      MastodonMediaAttachment(
        id: (fullsize ?? thumbnail!).hashCode.abs().toString(),
        type: MediaType.image,
        url: fullsize ?? thumbnail!,
        previewUrl: thumbnail ?? fullsize!,
        remoteUrl: fullsize,
        description: alt.isEmpty ? null : alt,
        blurhash: '0',
        meta: (width != null && height != null)
            ? MediaAttachmentMetadata(
                original: Metadata(width: width, height: height),
              )
            : null,
      ),
    );
  }

  print('[Gallery] Extracted ${attachments.length} image(s) from gallery embed');
  return attachments;
}

/// Attempts to call `.toJson()` on an object and return the result as a map.
/// Returns null if the object has no such method or if it fails.
Map<String, dynamic>? _tryToJson(dynamic obj) {
  try {
    // ignore: avoid_dynamic_calls
    final result = (obj as dynamic).toJson() as Map<String, dynamic>;
    return result;
  } catch (_) {
    return null;
  }
}

/// The visibility of a post.
/// This is very Mastodon specific and currently doesn't mean much for Bluesky.
/// It is included for completeness, maybe this'll change in the future.
enum PostVisibility {
  /// Visible to everyone, shown on public timelines.
  @JsonValue('public')
  public,

  /// Visible to public, but not included in public timelines.
  @JsonValue('unlisted')
  unlisted,

  /// Visible to followers only, and to any mentioned users.
  @JsonValue('private')
  private,

  /// Visible only to mentioned users.
  @JsonValue('direct')
  direct,
}

/// Processes the parent posts of the given posts.
/// This is used to fetch the parent posts of a list of posts by their URIs.
Future<List<MastodonPost>> processParentPosts(
  bsky.Bluesky bluesky,
  List<MastodonPost> posts,
) async {
  // Collect all the CIDs of the posts we need to fetch.
  final uris = <atp.AtUri>[];
  for (final post in posts) {
    final uri = post.replyPostUri;
    if (uri != null) {
      if (!uris.contains(uri)) uris.add(uri);
    }
  }

  // Pull the posts from the server in chunks to avoid hitting the
  // maximum post limit.
  final results = await chunkResults(
    items: uris,
    callback: (chunk) async {
      final response = await bluesky.feed.getPosts(uris: chunk);
      return response.data.posts;
    },
  );

  // Map the results back to the original posts.
  final modifiedPosts = <MastodonPost>[];
  await databaseTransaction(() async {
    for (final post in posts) {
      final uri = post.replyPostUri;
      if (uri != null) {
        final replyPost = results.firstWhereOrNull((post) {
          return post.uri.toString() == uri.toString();
        });
        if (replyPost != null) {
          final reply = await MastodonPost.fromBlueSkyPost(replyPost);
          post
            ..inReplyToId = reply.id
            ..inReplyToAccountId = reply.account.id;
        }
      }
      modifiedPosts.add(post);
    }
  });

  return modifiedPosts;
}
