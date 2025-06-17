// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Theme configuration for the Stroll app
class StrollTheme {
  const StrollTheme._();

  // Color constants
  static const Color primaryColor = Color(0xFF8B88EF);
  static const Color primaryContainerColor = Color(0xFFCCC8FF);
  static const Color darkTextColor = Color(0xFF0F1115);
  static const Color profileBoxBackground = Color(0xFF121517);
  static const Color buttonBackground = Color(0xFF232A2E);
  static const Color lightTextOnDark = Colors.white;
  static const Color veryLightGreyText = Color(0xFFF5F5F5);
  static const Color mediumGreyText = Color(0xFFC4C4C4);
  static const Color bottomNavBackground = Color(0xFF0F1115);
  static const Color badgeBackground = Color(0xFFB5B2FF);

  // Theme configuration
  static final ThemeData data = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.black,
    fontFamily: 'ProximaNova',
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      onPrimary: veryLightGreyText,
      primaryContainer: primaryContainerColor,
      onPrimaryContainer: darkTextColor,
      secondary: Color(0xFFE5E5E5),
      onSecondary: darkTextColor,
      surface: Colors.black,
      onSurface: lightTextOnDark,
      error: Color(0xFFD32F2F),
      onError: lightTextOnDark,
      surfaceContainerHighest: profileBoxBackground,
      onSurfaceVariant: veryLightGreyText,
      outline: mediumGreyText,
      surfaceContainer: buttonBackground,
    ),
    iconTheme: const IconThemeData(color: primaryColor),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: bottomNavBackground,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
    ),
    badgeTheme: const BadgeThemeData(
      backgroundColor: badgeBackground,
      textColor: darkTextColor,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: primaryContainerColor,
        fontSize: 34.sp,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
        height: 1.h,
      ),
      titleLarge: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
        height: 1.27.h,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        height: 1.05.h,
      ),
      bodySmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        height: 1.h,
      ),
      labelSmall: TextStyle(
        fontSize: 11.sp,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
        height: 1.h,
      ),
    ),
  );
}
