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

## Artwork credits

The bundled reproductions are public-domain works downloaded from Wikimedia
Commons:

- [*The Starry Night*](https://commons.wikimedia.org/wiki/File:Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg) — Vincent van Gogh, 1889 (public domain)
- [*The Great Wave off Kanagawa*](https://commons.wikimedia.org/wiki/File:Great_Wave_off_Kanagawa2.jpg) — Katsushika Hokusai, circa 1831 (public domain)
- [*Water Lilies*](https://commons.wikimedia.org/wiki/File:Claude_Monet_-_Water_Lilies_-_1906,_Ryerson.jpg) — Claude Monet, 1906 (public domain)


