# Simple dev container to run the Flutter app as a web server
# This lets you run the project on any OS with Docker.

FROM ghcr.io/cirruslabs/flutter:stable

WORKDIR /app

# Copy only the project directory (app lives under emergency_demo1/)
COPY emergency_demo1 /app/emergency_demo1

WORKDIR /app/emergency_demo1

# Enable web support (no-op if already enabled)
RUN flutter config --enable-web || true

# Install deps if a pubspec exists (skip gracefully otherwise)
RUN if [ -f pubspec.yaml ]; then flutter pub get; else echo "No pubspec.yaml found; skipping 'flutter pub get'"; fi

# Expose web-server port
EXPOSE 8080

# Run the app via Flutter's built-in web server
# Note: This is for development/demo; for production prefer `flutter build web` and a static server.
CMD ["bash", "-lc", "if [ ! -f pubspec.yaml ]; then echo 'Error: pubspec.yaml not found in /app/emergency_demo1'; exit 1; fi; flutter pub get; flutter run -d web-server --web-hostname=0.0.0.0 --web-port=8080"]
