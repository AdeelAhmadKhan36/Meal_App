import 'package:flutter/material.dart';
import 'theme_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: ThemeColors.lightPrimary,
    scaffoldBackgroundColor: ThemeColors.lightBackground,
    cardColor: ThemeColors.lightCard,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: ThemeColors.lightText),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: ThemeColors.lightPrimary,
      foregroundColor: Colors.white,
    ),
    colorScheme: const ColorScheme.light(
      primary: ThemeColors.lightPrimary,
      background: ThemeColors.lightBackground,
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: ThemeColors.darkPrimary,
    scaffoldBackgroundColor: ThemeColors.darkBackground,
    cardColor: ThemeColors.darkCard,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: ThemeColors.darkText),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: ThemeColors.darkPrimary,
      foregroundColor: Colors.white,
    ),
    colorScheme: const ColorScheme.dark(
      primary: ThemeColors.darkPrimary,
      background: ThemeColors.darkBackground,
    ),
  );
}
