class Artwork {
  const Artwork({
    required this.title,
    required this.artist,
    required this.year,
    required this.imageAsset,
  });

  final String title;
  final String artist;
  final int year;
  final String imageAsset;
}

const artworks = <Artwork>[
  Artwork(
    title: 'The Starry Night',
    artist: 'Vincent van Gogh',
    year: 1889,
    imageAsset: 'assets/images/starry_night.jpg',
  ),
  Artwork(
    title: 'The Great Wave off Kanagawa',
    artist: 'Katsushika Hokusai',
    year: 1831,
    imageAsset: 'assets/images/great_wave.jpg',
  ),
  Artwork(
    title: 'Water Lilies',
    artist: 'Claude Monet',
    year: 1906,
    imageAsset: 'assets/images/water_lilies.jpg',
  ),
];
