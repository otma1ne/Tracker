import 'package:tracker/theme/drawer_theme.dart';
import 'package:tracker/theme/input_theme.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'button_theme.dart';

ThemeData darkTheme(BuildContext context) {
  return ThemeData(
    useMaterial3: false,
    colorScheme: darkColorScheme,
    fontFamily: poppins,
    scaffoldBackgroundColor: Colors.white,
    iconTheme: const IconThemeData(color: blackColor),
    textButtonTheme: textButtonThemeData,
    elevatedButtonTheme: elevatedButtonThemeData,
    outlinedButtonTheme: outlinedButtonTheme(),
    inputDecorationTheme: inputDecorationTheme,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: blackColor,
      elevation: 0,
    ),
    drawerTheme: drawerTheme,
    snackBarTheme: const SnackBarThemeData(
      contentTextStyle: TextStyle(color: whiteColor),
    ),
  );
}

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF94B2E6),
  onPrimary: Color(0xFF10264C),
  primaryContainer: Color(0xFF153366),
  onPrimaryContainer: Color(0xFFACC1E6),
  secondary: Color(0xFF7FA6E6),
  onSecondary: Color(0xFF001D4C),
  secondaryContainer: Color(0xFF002766),
  onSecondaryContainer: Color(0xFF9DB9E6),
  tertiary: Color(0xFFE6C3CE),
  onTertiary: Color(0xFF4C323B),
  tertiaryContainer: Color(0xFF66434F),
  onTertiaryContainer: Color(0xFFE6CDD5),
  error: Color(0xFFE69490),
  onError: Color(0xFF4C100D),
  errorContainer: Color(0xFF661511),
  onErrorContainer: Color(0xFFE6ACA9),
  background: Color(0xFF313233),
  onBackground: Color(0xFFe3e4e6),
  surface: Color(0xFF313233),
  onSurface: Color(0xFFe3e4e6),
  surfaceVariant: Color(0xFF565c66),
  onSurfaceVariant: Color(0xFFd5dbe6),
  outline: Color(0xFFa1a7b3),
);
