import 'package:cecs453_lab_2/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows the first artwork and gallery controls', (tester) async {
    await tester.pumpWidget(const ArtSpaceApp());

    expect(find.text('The Starry Night'), findsOneWidget);
    expect(find.text('Vincent van Gogh (1889)'), findsOneWidget);
    expect(_displayedAsset(tester), 'assets/images/starry_night.jpg');
    expect(find.widgetWithText(FilledButton, 'Previous'), findsOneWidget);
    expect(find.widgetWithText(FilledButton, 'Next'), findsOneWidget);
  });

  testWidgets('moves forward and backward through the collection', (
    tester,
  ) async {
    await tester.pumpWidget(const ArtSpaceApp());

    final previousAtStart = tester.widget<FilledButton>(
      find.widgetWithText(FilledButton, 'Previous'),
    );
    expect(previousAtStart.onPressed, isNull);

    final nextButton = find.widgetWithText(FilledButton, 'Next');
    await tester.ensureVisible(nextButton);
    await tester.tap(nextButton);
    await tester.pumpAndSettle();

    expect(find.text('The Great Wave off Kanagawa'), findsOneWidget);
    expect(find.text('Katsushika Hokusai (1831)'), findsOneWidget);
    expect(_displayedAsset(tester), 'assets/images/great_wave.jpg');
    final previousAfterNext = tester.widget<FilledButton>(
      find.widgetWithText(FilledButton, 'Previous'),
    );
    expect(previousAfterNext.onPressed, isNotNull);

    final previousButton = find.widgetWithText(FilledButton, 'Previous');
    await tester.ensureVisible(previousButton);
    await tester.tap(previousButton);
    await tester.pumpAndSettle();

    expect(find.text('The Starry Night'), findsOneWidget);
    expect(_displayedAsset(tester), 'assets/images/starry_night.jpg');
  });

  testWidgets('disables Next on the final artwork', (tester) async {
    await tester.pumpWidget(const ArtSpaceApp());

    final nextButton = find.widgetWithText(FilledButton, 'Next');
    await tester.ensureVisible(nextButton);
    await tester.tap(nextButton);
    await tester.pumpAndSettle();
    await tester.ensureVisible(nextButton);
    await tester.tap(nextButton);
    await tester.pumpAndSettle();

    expect(find.text('Water Lilies'), findsOneWidget);
    expect(find.text('Claude Monet (1906)'), findsOneWidget);
    expect(_displayedAsset(tester), 'assets/images/water_lilies.jpg');
    final nextAtEnd = tester.widget<FilledButton>(
      find.widgetWithText(FilledButton, 'Next'),
    );
    expect(nextAtEnd.onPressed, isNull);
  });
}

String _displayedAsset(WidgetTester tester) {
  final image = tester.widget<Image>(find.byType(Image));
  return (image.image as AssetImage).assetName;
}
