import 'package:cecs453_lab_2/artwork.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('bundles a three-piece artwork collection', () {
    expect(artworks, hasLength(3));
    expect(artworks.first.title, 'The Starry Night');
    expect(artworks.first.imageAsset, 'assets/images/starry_night.jpg');
  });
}
