import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

abstract final class AppTheme {
  static ThemeData light = FlexThemeData.light(
    colors: const FlexSchemeColor(
      primary: Color(0xFF02396E),
      primaryContainer: Color(0xFF02396E),
      secondary: Color(0xFF909191),
      secondaryContainer: Color(0xFFAAABAB),
      tertiary: Color(0xFF4285F4),
      tertiaryContainer: Color(0xFF3B78DC),
      appBarColor: Color(0xFF02396E),
      error: Color(0xFFB00020),
      errorContainer: Color(0xFFB00020),
    ),
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      useMaterial3Typography: false,
      useM2StyleDividerInM3: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
    useMaterial3: false,
    fontFamily: 'OpenSans',
  ).copyWith(
    scrollbarTheme: const ScrollbarThemeData().copyWith(
      thumbVisibility: WidgetStateProperty.all(true),
      thumbColor: WidgetStateProperty.all(Colors.grey[600]),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 36,
        color: CustomColors.rgba9898981,
        fontWeight: FontWeight.w700,
        letterSpacing: 1,
        fontFamily: 'OpenSans',
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        color: CustomColors.rgba9898981,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.5,
        fontFamily: 'OpenSans',
      ),
      headlineSmall: const TextStyle(
        fontSize: 24,
        color: CustomColors.rgba0001,
        fontWeight: FontWeight.w500,
        letterSpacing: 1,
        fontFamily: 'OpenSans',
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        color: CustomColors.rgba9898981,
        fontWeight: FontWeight.w700,
        letterSpacing: 1,
        fontFamily: 'OpenSans',
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        color: CustomColors.rgba9898981,
        fontWeight: FontWeight.w700,
        fontFamily: 'OpenSans',
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: CustomColors.rgba9898981,
        fontWeight: FontWeight.w600,
        fontFamily: 'OpenSans',
      ),
      bodyMedium: TextStyle(
        fontSize: 12,
        color: CustomColors.rgba9898981,
        fontWeight: FontWeight.w600,
        fontFamily: 'OpenSans',
      ),
      bodySmall: TextStyle(
        fontSize: 13,
        color: CustomColors.rgba9898981,
        fontFamily: 'OpenSans',
        fontWeight: FontWeight.w500,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        color: CustomColors.rgba9898981,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        fontFamily: 'OpenSans',
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        color: CustomColors.rgba9898981,
        fontWeight: FontWeight.w300,
        fontFamily: 'OpenSans',
        letterSpacing: 0,
      ),
    ),
  );
}