# Emergency_Demo1

################
  LOGIN PAGEE
################

#username : admin
#password : 12345678

## Docker (Run on Any OS)

This repo includes a Dockerfile to run the Flutter app as a web server, making it easy to run on any OS with Docker.

Prerequisites:
- Docker installed (Desktop or Engine)

Build the image (from repo root):

```
docker build -t emergency_demo1-web .
```

Run the app (serves on port 8080):

```
docker run --rm -p 8080:8080 emergency_demo1-web
```

Open http://localhost:8080 in your browser.

Notes:
- The app lives under `emergency_demo1/`. The Dockerfile copies that directory.
- This uses `flutter run -d web-server` for dev/demo. For production, prefer `flutter build web` and a static server (e.g., Nginx).
- Android/iOS emulators are not supported inside Docker; use Docker primarily for web runs or CI builds.
- Ensure `emergency_demo1/pubspec.yaml` exists. If it’s missing, `flutter run` will fail.
