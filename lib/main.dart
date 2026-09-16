import 'package:flutter/material.dart';

import 'art_space_page.dart';

void main() {
  runApp(const ArtSpaceApp());
}

class ArtSpaceApp extends StatelessWidget {
  const ArtSpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    const background = Color(0xFFF7F4EE);
    const accent = Color(0xFF4E6298);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Art Space',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: accent,
          brightness: Brightness.light,
          surface: background,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: accent,
            foregroundColor: Colors.white,
            disabledBackgroundColor: accent.withValues(alpha: 0.28),
            disabledForegroundColor: Colors.white70,
            minimumSize: const Size.fromHeight(52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      home: const ArtSpacePage(),
    );
  }
}
