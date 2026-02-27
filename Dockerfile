# Official Dart image: https://hub.docker.com/_/dart
FROM dart:3.8 AS build

WORKDIR /app

# Resolve app dependencies.
COPY pubspec.* ./
RUN dart pub get

# Copy app source code and AOT compile it.
# This includes lib/src/generated/prisma/ which is committed to git.
COPY . .

# Install Node.js LTS.
RUN set -uex; \
    apt-get update; \
    apt-get install -y ca-certificates curl gnupg; \
    mkdir -p /etc/apt/keyrings; \
    curl -fsSL https://deb.nodesource.com/setup_21.x | bash - && \
    apt-get install -y nodejs

RUN npm i prisma@5
RUN npx prisma@5 generate

# Generate a production build.
RUN dart pub global activate dart_frog_cli
RUN dart pub global run dart_frog_cli:dart_frog build

# Restore generated Prisma files into build/ after dart_frog bundling
RUN mkdir -p build/lib/src/generated/prisma && \
    cp lib/src/generated/prisma/client.dart build/lib/src/generated/prisma/ && \
    cp lib/src/generated/prisma/prisma.dart build/lib/src/generated/prisma/ && \
    cp lib/src/generated/prisma/model.dart build/lib/src/generated/prisma/

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
RUN npx prisma@5 generate

COPY --from=odroe/prisma-dart:latest / /runtime
COPY --from=build /app/build/bin/server /app/bin/
COPY --from=build /app/build/public /app/public/
COPY --from=build /app/entrypoint.sh /app/
COPY --from=build /app/prisma /app/prisma
COPY --from=build /app/node_modules/prisma/query-engine-* /app/bin/

WORKDIR /app

# Start the server.
CMD ["/app/entrypoint.sh"]
