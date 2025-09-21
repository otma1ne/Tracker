import 'package:tracker/theme/drawer_theme.dart';
import 'package:tracker/theme/input_theme.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'button_theme.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    useMaterial3: false,
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

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF3580FF),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFACC1E6),
  onPrimaryContainer: Color(0xFF0B1933),
  secondary: Color(0xFF002055),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFF9DB9E6),
  onSecondaryContainer: Color(0xFF001333),
  tertiary: Color(0xFF7D5260),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFE6CDD5),
  onTertiaryContainer: Color(0xFF332227),
  error: Color(0xFFB3261E),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFE6ACA9),
  onErrorContainer: Color(0xFF330B09),
  background: Color(0xFFfbfcfc),
  onBackground: Color(0xFF313233),
  surface: Color(0xFFfbfcfc),
  onSurface: Color(0xFF313233),
  surfaceVariant: Color(0xFFdadee6),
  onSurfaceVariant: Color(0xFF565c66),
  outline: Color(0xFF818a99),
);
