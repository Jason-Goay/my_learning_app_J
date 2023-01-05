import 'package:flutter/material.dart';
import 'package:my_learning_app/utils/utils.dart';

class AppTheme {
  static const _lightFillColor = AppColor.black;

  static const ColorScheme colorScheme = ColorScheme(
    primary: AppColor.darkBlue,
    secondary: AppColor.lightBlue,
    secondaryContainer: AppColor.orange,
    background: Color(0xFFE6EBEB),
    surface: Color(0xFFFAFBFB),
    onBackground: Colors.white,
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
    tertiary: AppColor.beige,
    tertiaryContainer: AppColor.lightOrange,
    onTertiary: AppColor.lightPink,
    onTertiaryContainer: AppColor.greyBlue,
    shadow: AppColor.grey,
    onSecondaryContainer: AppColor.greYer,
    onPrimaryContainer: AppColor.greYest,
  );
}
