import 'package:flutter/material.dart';

class ColorShades {
  final Color darkest;
  final Color dark80;
  final Color dark60;
  final Color dark40;
  final Color dark20;
  final Color base;
  final Color light20;
  final Color light40;
  final Color light60;
  final Color light80;
  final Color lightest;

  const ColorShades({
    required this.darkest,
    required this.dark80,
    required this.dark60,
    required this.dark40,
    required this.dark20,
    required this.base,
    required this.light20,
    required this.light40,
    required this.light60,
    required this.light80,
    required this.lightest,
  });
}

class ColorPalette {
  final ColorShades primary;
  final ColorShades secondary;
  final ColorShades tertiary;
  final ColorShades neutral;
  final ColorShades error;
  final ColorShades success;

  const ColorPalette({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.neutral,
    required this.error,
    required this.success,
  });
}

const _primary = ColorShades(
  darkest: Color(0xFF00295d),
  dark80: Color(0xFF003271),
  dark60: Color(0xFF004294),
  dark40: Color(0xFF0051B5),
  dark20: Color(0xFF005DD1),
  base: Color(0xFF006CF2),
  light20: Color(0xFF3A92FF),
  light40: Color(0xFF66A6F7),
  light60: Color(0xFF92C2FF),
  light80: Color(0xFFCCEEFD),
  lightest: Color(0xFFEEF5FF),
);

const _secondary = ColorShades(
  darkest: Color(0xFF071323),
  dark80: Color(0xFF08182D),
  dark60: Color(0xFF0B1B31),
  dark40: Color(0xFF0E213A),
  dark20: Color(0xFF0D2443),
  base: Color(0xFF001F45),
  light20: Color(0xFF173A67),
  light40: Color(0xFF1F508E),
  light60: Color(0xFF406DA7),
  light80: Color(0xFF86A7D2),
  lightest: Color(0xFFCCD9E9),
);

const _tertiary = ColorShades(
  darkest: Color(0xFFFF9900),
  dark80: Color(0xFFFFA200),
  dark60: Color(0xFFFFAB05),
  dark40: Color(0xFFFFBB00),
  dark20: Color(0xFFFFCC00),
  base: Color(0xFFFFD200),
  light20: Color(0xFFFFDC3A),
  light40: Color(0xFFFFE467),
  light60: Color(0xFFFFEB8F),
  light80: Color(0xFFFFF0AC),
  lightest: Color(0xFFFFF5C5),
);

const _neutral = ColorShades(
  darkest: Color(0xFF111111),
  dark80: Color(0xFF1F1F24),
  dark60: Color(0xFF3E3E41),
  dark40: Color(0xFF5E5E63),
  dark20: Color(0xFF8D8D97),
  base: Color(0xFFB4B4BB),
  light20: Color(0xFFCECED4),
  light40: Color(0xFFE0E0E6),
  light60: Color(0xFFF0EFF2),
  light80: Color(0xFFFCFCFC),
  lightest: Color(0xFFFFFFFF),
);

const _success = ColorShades(
  darkest: Color(0xFF006600),
  dark80: Color(0xFF007A00),
  dark60: Color(0xFF009900),
  dark40: Color(0xFF00B300),
  dark20: Color(0xFF00CC00),
  base: Color(0xFF00E600),
  light20: Color(0xFF33FF33),
  light40: Color(0xFF66FF66),
  light60: Color(0xFF99FF99),
  light80: Color(0xFFCCFFCC),
  lightest: Color(0xFFE5FFE5),
);

const _error = ColorShades(
  darkest: Color(0xFF702126),
  dark80: Color(0xFF8C2B2B),
  dark60: Color(0xFFA62F2F),
  dark40: Color(0xFFC03333),
  dark20: Color(0xFFD33636),
  base: Color(0xFFE63A3A),
  light20: Color(0xFFF05A5A),
  light40: Color(0xFFF37A7A),
  light60: Color(0xFFF69A9A),
  light80: Color(0xFFF9BABA),
  lightest: Color(0xFFFCDCDC),
);

final lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: _primary.base,
  onPrimary: _neutral.light80,
  primaryContainer: _primary.light80,
  onPrimaryContainer: _neutral.darkest,
  inversePrimary: _primary.darkest,
  secondary: _secondary.base,
  onSecondary: _neutral.lightest,
  secondaryContainer: _secondary.light80,
  onSecondaryContainer: _neutral.darkest,
  tertiary: _tertiary.base,
  onTertiary: _neutral.lightest,
  tertiaryContainer: _tertiary.light80,
  onTertiaryContainer: _neutral.darkest,
  background: _neutral.lightest,
  onBackground: _neutral.darkest,
  surface: _neutral.light60,
  onSurface: _neutral.darkest,
  surfaceVariant: _neutral.light20,
  onSurfaceVariant: _neutral.dark40,
  surfaceTint: _neutral.light20,
  inverseSurface: _neutral.dark60,
  error: _error.base,
  onError: _neutral.lightest,
  errorContainer: _error.lightest,
  onErrorContainer: _neutral.dark80,
  outline: _neutral.base,
  outlineVariant: _neutral.light40,
  scrim: _neutral.dark80,
);

const ColorScheme darkColorScheme = ColorScheme.dark();

const AppColorPalette = ColorPalette(
  primary: _primary,
  secondary: _secondary,
  tertiary: _tertiary,
  neutral: _neutral,
  error: _error,
  success: _success,
);

// other colors
const momentsUserNameColor = Color(0xFF505D8A);
