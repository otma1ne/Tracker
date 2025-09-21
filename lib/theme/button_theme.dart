import 'package:flutter/material.dart';
import '../constants.dart';

ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w500,
      color: whiteColor,
      fontSize: 16,
    ),
    padding: const EdgeInsets.all(defaultPadding),
    foregroundColor: whiteColor,
    backgroundColor: primaryColor,
    elevation: 0,
    shadowColor: Colors.transparent,
    minimumSize: const Size(double.infinity, 46),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(defaultBorderRadius),
      ),
    ),
  ),
);

TextButtonThemeData textButtonThemeData = TextButtonThemeData(
  style: TextButton.styleFrom(
    padding: EdgeInsets.zero,
    foregroundColor: primaryColor,
    elevation: 0,
    shadowColor: Colors.transparent,
  ),
);

OutlinedButtonThemeData outlinedButtonTheme(
    {Color borderColor = blackColor10}) {
  return OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      textStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        color: whiteColor,
        fontSize: 16,
      ),
      padding: const EdgeInsets.all(defaultPadding),
      foregroundColor: primaryColor,
      elevation: 0,
      shadowColor: Colors.transparent,
      minimumSize: const Size(double.infinity, 46),
      side: BorderSide(width: 1.5, color: borderColor),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(defaultBorderRadius),
        ),
      ),
    ),
  );
}
