import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io' show Platform;

class ThemeConfig {
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF6366F1), // Indigo
      onPrimary: Colors.white,
      primaryContainer: Color(0xFF3730A3),
      onPrimaryContainer: Colors.white,
      secondary: Color(0xFF10B981), // Emerald
      onSecondary: Colors.white,
      secondaryContainer: Color(0xFF065F46),
      onSecondaryContainer: Colors.white,
      tertiary: Color(0xFFF59E0B), // Amber
      onTertiary: Colors.white,
      tertiaryContainer: Color(0xFF92400E),
      onTertiaryContainer: Colors.white,
      surface: Color(0xFF0F172A), // Slate 900
      onSurface: Colors.white,
      surfaceContainerHighest: Color(0xFF1E293B), // Slate 800
      surfaceContainerHigh: Color(0xFF334155), // Slate 700
      surfaceContainer: Color(0xFF475569), // Slate 600
      surfaceContainerLow: Color(0xFF64748B), // Slate 500
      surfaceContainerLowest: Color(0xFF94A3B8), // Slate 400
      background: Color(0xFF020617), // Slate 950
      onBackground: Colors.white,
      error: Color(0xFFEF4444), // Red 500
      onError: Colors.white,
      errorContainer: Color(0xFF7F1D1D), // Red 900
      onErrorContainer: Colors.white,
      outline: Color(0xFF475569), // Slate 600
      outlineVariant: Color(0xFF334155), // Slate 700
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFFF8FAFC), // Slate 50
      onInverseSurface: Color(0xFF0F172A), // Slate 900
      inversePrimary: Color(0xFF818CF8), // Indigo 400
      surfaceTint: Color(0xFF6366F1), // Indigo 500
    ),
    textTheme: GoogleFonts.interTextTheme(
      const TextTheme(
        displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: -0.5),
        displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, letterSpacing: -0.25),
        displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        headlineLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        titleLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        titleMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        titleSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
        bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
        labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.5),
        labelSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, letterSpacing: 0.5),
      ),
    ),
    cardTheme: CardThemeData(
      elevation: 8,
      shadowColor: Colors.black.withOpacity(0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: const Color(0xFF1E293B),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Color(0xFF0F172A),
      foregroundColor: Colors.white,
      centerTitle: true,
    ),
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF6366F1),
      brightness: Brightness.light,
      primary: const Color(0xFF6366F1),
      secondary: const Color(0xFF10B981),
      surface: const Color(0xFFF8FAFC), // Slate 50
      background: const Color(0xFFFFFFFF),
    ),
    textTheme: GoogleFonts.interTextTheme(
      const TextTheme(
        // Copying font scale from dark theme
        displayLarge: TextStyle(fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(fontWeight: FontWeight.w600),
      ),
    ),
    cardTheme: CardThemeData(
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Color(0xFFF8FAFC),
      foregroundColor: Color(0xFF0F172A),
      centerTitle: true,
    ),
  );
}
