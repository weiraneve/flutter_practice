import 'package:flutter/material.dart';

class FontSize {
  const FontSize._();

  static const double Smallest = 12.0;
  static const double XXXS = 14.0;
  static const double XXS = 16.0;
  static const double XS = 18.0;
  static const double S = 20.0;
  static const double M = 24.0;
  static const double L = 32.0;
  static const double XL = 40.0;
  static const double XXL = 64.0;
  static const double Display = 80.0;
  static const double Giant = 96.0;
}

const textTheme = TextTheme(
  displayLarge: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: FontSize.XL,
  ),
  displayMedium: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: FontSize.L,
  ),
  displaySmall: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: FontSize.M,
  ),
  headlineLarge: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: FontSize.L,
  ),
  headlineMedium: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: FontSize.M,
  ),
  headlineSmall: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: FontSize.S,
  ),
  titleLarge: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: FontSize.M,
  ),
  titleMedium: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: FontSize.S,
  ),
  titleSmall: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: FontSize.XS,
  ),
  bodyLarge: TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: FontSize.XXS,
  ),
  bodyMedium: TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: FontSize.XXS,
  ),
  bodySmall: TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: FontSize.XXS,
  ),
  labelLarge: TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: FontSize.XXS,
  ),
  labelMedium: TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: FontSize.XXXS,
  ),
  labelSmall: TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: FontSize.Smallest,
  ),
);
