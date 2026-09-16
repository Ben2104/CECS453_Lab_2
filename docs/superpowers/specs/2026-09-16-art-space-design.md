# Art Space App Design

## Goal

Build a Flutter Art Space app for a general museum and classroom audience. The app displays one artwork at a time and lets the viewer move through a small curated collection.

## Interface

The single screen is divided vertically into three clear sections:

1. Artwork wall: a large framed local image with a subtle shadow.
2. Artwork descriptor: artwork title, artist, and year.
3. Display controller: Previous and Next buttons.

The visual style follows the assignment prototype: neutral off-white background, dark typography, muted blue controls, generous spacing, and no navigation chrome beyond the required controls. The layout adapts to narrow phones and remains scrollable on short screens.

## Behavior

The app starts on the first artwork. Next advances one item and Previous returns one item. Previous is disabled on the first item and Next is disabled on the final item. Each change updates the image and descriptor together.

## Data and Assets

Artwork metadata is represented by an immutable `Artwork` model. The collection is local and deterministic. Three bundled public-domain artwork images are used so the app works offline and during grading.

## Structure

- `lib/main.dart`: application entry point and theme.
- `lib/artwork.dart`: immutable artwork model and local collection.
- `lib/art_space_page.dart`: stateful gallery screen and three UI sections.
- `assets/images/`: bundled artwork images.
- `test/art_space_page_test.dart`: navigation, boundary, and content widget tests.

## Verification

Run `flutter analyze` and `flutter test`. Build an Android debug APK to confirm asset packaging and platform compilation.

