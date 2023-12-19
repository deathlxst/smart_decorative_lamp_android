import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodySmall11 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 11.fSize,
      );
  // Inter text style
  static get interDeeppurple900 => TextStyle(
        color: appTheme.deepPurple900,
        fontSize: 100.fSize,
        fontWeight: FontWeight.w800,
      ).inter;
  static get interGray800 => TextStyle(
        color: appTheme.gray800,
        fontSize: 100.fSize,
        fontWeight: FontWeight.w800,
      ).inter;
  static get interGreen90002 => TextStyle(
        color: appTheme.green90002,
        fontSize: 100.fSize,
        fontWeight: FontWeight.w800,
      ).inter;
  static get interOrange500 => TextStyle(
        color: appTheme.orange500,
        fontSize: 100.fSize,
        fontWeight: FontWeight.w800,
      ).inter;
  static get interPurple800 => TextStyle(
        color: appTheme.purple800,
        fontSize: 100.fSize,
        fontWeight: FontWeight.w800,
      ).inter;
  static get interRed900 => TextStyle(
        color: appTheme.red900,
        fontSize: 100.fSize,
        fontWeight: FontWeight.w800,
      ).inter;
  static get interRedA700 => TextStyle(
        color: appTheme.redA700,
        fontSize: 100.fSize,
        fontWeight: FontWeight.w800,
      ).inter;
  static get interWhiteA700 => TextStyle(
        color: appTheme.whiteA700,
        fontSize: 100.fSize,
        fontWeight: FontWeight.w800,
      ).inter;
  static get interYellowA200 => TextStyle(
        color: appTheme.yellowA200,
        fontSize: 100.fSize,
        fontWeight: FontWeight.w800,
      ).inter;
  // Title text style
  static get titleLargeWhiteA700 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.whiteA700,
      );
    static const TextStyle titleLargeGrayA700 = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
    color: Colors.grey, // Change to your desired color
  );
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }
}
