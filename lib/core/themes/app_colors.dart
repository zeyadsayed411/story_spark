import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Gradient Colors
  static const LinearGradient yellowGradient = LinearGradient(
    colors: [
      Color(0xFFEFE7A1), // light yellow
      Color(0xFFDCECCB), // soft green
      Color(0xFFF5F1D6), // creamy light
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient pinkGradient = LinearGradient(
    colors: [
      Color(0xFFF6D5DB), // soft pink
      Color(0xFFF3EAEA), // very light center
      Color(0xFFD6E6F2), // light blue
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient purpleBlueGradient = LinearGradient(
    colors: [
      Color(0xFF6A1B9A), // dark purple
      Color(0xFF008080), // teal blue
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient redPinkGradient = LinearGradient(
    colors: [
      Color(0xFF8F425F), // dark pink/red tone
      Color(0x00FF9FBF), // light pink
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Solid Colors
  static const Color darkPurple = Color(0xFF8F425F);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Colors.grey;
  static const Color errorRed = Color(0xFFE57373);
  static const Color inputFillColor = Color(0xFFF3EEFF);
  static const Color textDarkGrey = Color(0xFF5E5A62);
}
