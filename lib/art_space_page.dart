import 'package:flutter/material.dart';

import 'artwork.dart';

class ArtSpacePage extends StatefulWidget {
  const ArtSpacePage({super.key});

  @override
  State<ArtSpacePage> createState() => _ArtSpacePageState();
}

class _ArtSpacePageState extends State<ArtSpacePage> {
  int _selectedIndex = 0;

  void _showPreviousArtwork() {
    setState(() => _selectedIndex--);
  }

  void _showNextArtwork() {
    setState(() => _selectedIndex++);
  }

  @override
  Widget build(BuildContext context) {
    final artwork = artworks[_selectedIndex];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 28),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 560),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const _GalleryHeading(),
                  const SizedBox(height: 20),
                  _ArtworkWall(artwork: artwork),
                  const SizedBox(height: 28),
                  _ArtworkDescriptor(artwork: artwork),
                  const SizedBox(height: 24),
                  _DisplayController(
                    canGoPrevious: _selectedIndex > 0,
                    canGoNext: _selectedIndex < artworks.length - 1,
                    onPrevious: _showPreviousArtwork,
                    onNext: _showNextArtwork,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GalleryHeading extends StatelessWidget {
  const _GalleryHeading();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          'ART SPACE',
          style: TextStyle(
            color: Color(0xFF4E6298),
            fontSize: 13,
            fontWeight: FontWeight.w800,
            letterSpacing: 2.2,
          ),
        ),
        SizedBox(width: 12),
        Expanded(child: Divider(color: Color(0xFFD4D0C8))),
      ],
    );
  }
}

class _ArtworkWall extends StatelessWidget {
  const _ArtworkWall({required this.artwork});

  final Artwork artwork;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.14),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: AspectRatio(
          aspectRatio: 4 / 3,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 280),
            child: Semantics(
              key: ValueKey(artwork.imageAsset),
              image: true,
              label: '${artwork.title} by ${artwork.artist}',
              child: Image.asset(
                artwork.imageAsset,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ArtworkDescriptor extends StatelessWidget {
  const _ArtworkDescriptor({required this.artwork});

  final Artwork artwork;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 220),
      child: Container(
        key: ValueKey(artwork.title),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
        color: const Color(0xFFEAE7F0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              artwork.title,
              style: const TextStyle(
                color: Color(0xFF202027),
                fontSize: 27,
                height: 1.08,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 9),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: artwork.artist,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  TextSpan(text: ' (${artwork.year})'),
                ],
              ),
              style: const TextStyle(color: Color(0xFF34323A), fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}

class _DisplayController extends StatelessWidget {
  const _DisplayController({
    required this.canGoPrevious,
    required this.canGoNext,
    required this.onPrevious,
    required this.onNext,
  });

  final bool canGoPrevious;
  final bool canGoNext;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FilledButton(
            onPressed: canGoPrevious ? onPrevious : null,
            child: const Text('Previous'),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: FilledButton(
            onPressed: canGoNext ? onNext : null,
            child: const Text('Next'),
          ),
        ),
      ],
    );
  }
}
