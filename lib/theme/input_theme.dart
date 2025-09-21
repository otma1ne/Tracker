import 'package:flutter/material.dart';
import 'package:tracker/constants.dart';

InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  contentPadding: const EdgeInsets.symmetric(
    horizontal: defaultPadding,
    vertical: defaultPadding,
  ),
  labelStyle: const TextStyle(color: Colors.black),
  hintStyle: const TextStyle(color: grey2, fontSize: 14),
  filled: true,
  fillColor: whiteColor,
  border: OutlineInputBorder(
    borderSide: const BorderSide(
      color: grey4,
      width: 1.0,
    ),
    borderRadius: BorderRadius.circular(defaultBorderRadius),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: grey4,
      width: 1.0,
    ),
    borderRadius: BorderRadius.circular(defaultBorderRadius),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: primaryColor,
      width: 1.0,
    ),
    borderRadius: BorderRadius.circular(defaultBorderRadius),
  ),
  constraints: const BoxConstraints(minHeight: 56),
);
