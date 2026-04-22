import 'package:flutter/material.dart';

class AppColors {
  // Prevent creating instance
  AppColors._();

  // Gardient Colors
  static LinearGradient yellowGradient = LinearGradient(
    colors: [
      Color(0xFFEFE7A1), // light yellow
      Color(0xFFDCECCB), // soft green
      Color(0xFFF5F1D6), // creamy light
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static LinearGradient pinkGradient = LinearGradient(
    colors: [
      Color(0xFFF6D5DB), // soft pink (top-left)
      Color(0xFFF3EAEA), // very light center
      Color(0xFFD6E6F2), // light blue (bottom-right)
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient purbleBlueGradient = LinearGradient(
    colors: [
      Color(0xFF6A1B9A), // dark purple
      Color(0xFF008080), // teal blue
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static LinearGradient redPinkGradient = LinearGradient(
    colors: [
      Color(0xFFB71C1C), // dark pink/red tone (left side)
      Color(0xFFF8BBD0), // light pink (right side)
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Solid Colors
  static const Color darkPurble = Color(0xFF6A1B9A);
  static const Color black = Color(0xFF000000);
}
