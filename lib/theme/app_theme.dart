import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primary = Color(0xFFFFD700);
  static const Color primaryVariant = Color(0xFFDAA520);
  static const Color secondary = Color(0xFFFFA000);

  static final List<Color> depthBackgrounds = [
    const Color(0xFF3E2723),
    const Color(0xFF4E342E),
    const Color(0xFF5D4037),
    const Color(0xFF6D4C41),
    const Color(0xFF795548),
  ];

  static const Color prestigeButton = Color(0xFFD32F2F);

  static final Color textOnDark = Colors.amber.shade100;
  static final Color textSecondary = Colors.amber.shade200;
  static const Color textDisabled = Colors.grey;

  static const Color cardBackground = Colors.black54;
  static const Color cardBorder = Colors.amber;
}

final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.depthBackgrounds[0],
  primaryColor: AppColors.primary,
  textTheme: GoogleFonts.cinzelTextTheme().apply(
    bodyColor: AppColors.textOnDark,
    displayColor: AppColors.textOnDark,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.secondary,
      foregroundColor: Colors.brown.shade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF000000),
    iconTheme: IconThemeData(color: AppColors.primary),
  ),
);