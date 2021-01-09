import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final ThemeData simpleDarkTheme =
    ThemeData.from(colorScheme: const ColorScheme.dark());

ThemeData get greyTheme {
  const primaryColor = Color(0xFF999999);
  const subColor = Color(0xFF999999);
  return ThemeData.from(
    colorScheme: const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: subColor,
    ),
  ).copyWith(
    brightness: Brightness.light,
    primaryColor: subColor,
    accentColor: primaryColor,
    buttonColor: subColor,
    buttonTheme: const ButtonThemeData(
      buttonColor: subColor,
    ),
    iconTheme: const IconThemeData(
      color: primaryColor,
    ),
  );
}

ThemeData get skyBlueTheme {
  const primaryColor = Color(0xFF86C5FC);
  const subColor = Color(0xFF86C5FC);
  return ThemeData.from(
    colorScheme: const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: subColor,
    ),
  ).copyWith(
    brightness: Brightness.light,
    primaryColor: subColor,
    accentColor: primaryColor,
    buttonColor: subColor,
    buttonTheme: const ButtonThemeData(
      buttonColor: subColor,
    ),
    iconTheme: const IconThemeData(
      color: primaryColor,
    ),
    toggleableActiveColor: subColor,
  );
}

ThemeData get emeraldGreenTheme {
  final primaryColor = Color(0xFF00a968);
  const secondaryColor = Color(0xFF00a968);
  return ThemeData.from(
    colorScheme: const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    ),
  ).copyWith(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    accentColor: secondaryColor,
    buttonColor: primaryColor,
    buttonTheme: ButtonThemeData(
      buttonColor: primaryColor,
    ),
    iconTheme: const IconThemeData(
      color: secondaryColor,
    ),
    toggleableActiveColor: secondaryColor,
    cupertinoOverrideTheme: const CupertinoThemeData(
      textTheme: CupertinoTextThemeData(),
    ),
  );
}
