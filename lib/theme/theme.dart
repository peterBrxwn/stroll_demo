import 'package:flutter/material.dart';

const _primaryColor = Color(0xFF8B88EF);
const _primaryContainerColor = Color(0xFFCCC8FF);
const _darkTextColor = Color(0xFF0F1115);

const _profileBoxBackground = Color(0xFF121517);
const _buttonBackground = Color(0xFF232A2E);

const _lightTextOnDark = Colors.white;
const _veryLightGreyText = Color(0xFFF5F5F5);
const _mediumGreyText = Color(0xFFC4C4C4);

final appTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: _primaryColor,
  scaffoldBackgroundColor: Colors.black,
  fontFamily: 'Inter',
  colorScheme: ColorScheme.dark(
    primary: _primaryColor,
    onPrimary: _veryLightGreyText,
    primaryContainer: _primaryContainerColor,
    onPrimaryContainer: _darkTextColor,
    secondary: const Color(0xFFE5E5E5),
    onSecondary: _darkTextColor,
    surface: Colors.black,
    onSurface: _lightTextOnDark,
    error: Colors.red.shade700,
    onError: _lightTextOnDark,
    surfaceContainerHighest: _profileBoxBackground,
    onSurfaceVariant: _veryLightGreyText,
    outline: _mediumGreyText,
    surfaceContainer: _buttonBackground,
  ),
  iconTheme: const IconThemeData(color: _primaryColor),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF0F1115),
    showSelectedLabels: false,
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,
  ),
  badgeTheme: const BadgeThemeData(
    backgroundColor: Color(0xFFB5B2FF),
    textColor: _darkTextColor,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 57,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.12,
    ),
    displayMedium: TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.16,
    ),
    displaySmall: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.22,
    ),
    headlineLarge: TextStyle(
      color: _primaryContainerColor,
      fontSize: 34,
      fontWeight: FontWeight.bold,
      letterSpacing: 0,
      height: 1.25,
    ),
    headlineMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.29,
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.33,
    ),
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.27,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      height: 1.5,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      height: 1.43,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      height: 1.5,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      height: 1.43,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      height: 1.33,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      height: 1.43,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      height: 1.33,
    ),
    labelSmall: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      height: 1.27,
    ),
  ),
);
