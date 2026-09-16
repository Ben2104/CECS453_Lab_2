# CECS453_Lab_2 — Art Space

A Flutter gallery app created for CECS 453 Lab Assignment 2. It presents a
small collection of public-domain artwork with title, artist, year, and
Previous/Next controls.

## Run

```bash
flutter pub get
flutter run
```

## Verify

```bash
flutter analyze
flutter test
flutter build apk --debug
```

## Project structure

- `lib/main.dart` starts the app and defines its visual theme.
- `lib/art_space_page.dart` contains the artwork wall, descriptor, and controls.
- `lib/artwork.dart` defines the artwork model and local collection.
- `assets/images/` contains the bundled artwork images.
- `test/` contains model and interaction tests.

## Artwork credits

The bundled reproductions are public-domain works downloaded from Wikimedia
Commons:

- *The Starry Night* — Vincent van Gogh, 1889
- *The Great Wave off Kanagawa* — Katsushika Hokusai, circa 1831
- *Water Lilies* — Claude Monet, 1906

## Submission checklist

- Record a project demonstration video shorter than two minutes.
- Export the Dart source code to PDF.
- Create a ZIP archive of the complete project.
- Push the project to a GitHub repository named `CECS453_Lab_2` and paste its
  link into Canvas.
- Add the agreed completion comment for each team member.
