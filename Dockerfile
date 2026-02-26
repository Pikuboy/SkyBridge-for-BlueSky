# Official Dart image: https://hub.docker.com/_/dart
# Specify the Dart SDK base image version using dart:<version> (ex: dart:2.17)
FROM dart:3.8 AS build

WORKDIR /app

# Resolve app dependencies.
COPY pubspec.* ./
RUN dart pub get

# Copy app source code and AOT compile it.
COPY . .

# Install Node.js LTS.
RUN set -uex; \
    apt-get update; \
    apt-get install -y ca-certificates curl gnupg; \
    mkdir -p /etc/apt/keyrings; \
    curl -fsSL https://deb.nodesource.com/setup_21.x | bash - && \
    apt-get install -y nodejs

RUN npm i prisma@5
# Remove ALL generated files before regenerating to avoid conflicts
RUN rm -rf lib/src/generated/prisma
RUN npx prisma generate

# Generate a production build.
RUN dart pub global activate dart_frog_cli
RUN dart pub global run dart_frog_cli:dart_frog build

# Copy Prisma generated files into the build directory
# (dart_frog build does not include generated/ files automatically)
RUN mkdir -p build/lib/src/generated/prisma && \
    cp lib/src/generated/prisma/prisma_client.dart build/lib/src/generated/prisma/ && \
    cp lib/src/generated/prisma/prisma_client.g.dart build/lib/src/generated/prisma/

# Ensure packages are still up-to-date if anything has changed.
RUN dart pub get --offline
RUN dart compile exe build/server/server.dart -o build/bin/server

# Build minimal serving image from AOT-compiled `/server` and required system
# libraries and configuration files stored in `/runtime/` from the build stage.
FROM dart:stable AS runtime

RUN set -uex; \
    apt-get update; \
    apt-get install -y ca-certificates curl gnupg; \
    mkdir -p /etc/apt/keyrings; \
    curl -fsSL https://deb.nodesource.com/setup_21.x | bash - && \
    apt-get install -y nodejs

RUN npm i prisma@5

COPY --from=odroe/prisma-dart:latest / /runtime
COPY --from=build /app/build/bin/server /app/bin/
COPY --from=build /app/build/public /app/public/
COPY --from=build /app/entrypoint.sh /app/
COPY --from=build /app/prisma /app/prisma
COPY --from=build /app/node_modules/prisma/query-engine-* /app/bin/

# Start the server.
CMD ["/app/entrypoint.sh"]