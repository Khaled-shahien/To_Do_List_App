import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF6366F1), // Indigo
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 4,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: const Color(0xFF6366F1),
      foregroundColor: Colors.white,
      elevation: 6,
      focusElevation: 8,
      hoverElevation: 8,
      splashColor: Colors.white.withValues(alpha: 0.4),
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: Color(0xFF1F2937),
      ),
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Color(0xFF1F2937),
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color(0xFF1F2937),
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color(0xFF6B7280),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF8B5CF6), // Violet
      brightness: Brightness.dark,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 4,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: const Color(0xFF8B5CF6),
      foregroundColor: Colors.white,
      elevation: 6,
      focusElevation: 8,
      hoverElevation: 8,
      splashColor: Colors.white.withValues(alpha: 0.4),
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: Color(0xFFF9FAFB),
      ),
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Color(0xFFF9FAFB),
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color(0xFFF9FAFB),
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color(0xFFD1D5DB),
      ),
    ),
  );
}
