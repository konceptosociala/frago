import 'package:flutter/material.dart';
import 'package:frago/core/colors.dart';

ThemeData darkTheme({bool interactive = true}) => ThemeData(
  fontFamily: 'FiraSans',
  brightness: Brightness.dark,
  scaffoldBackgroundColor: NothingColors.almostBlack,
  primaryColor: NothingColors.scarlet,
  colorScheme: ColorScheme.dark(
    primary: NothingColors.scarlet,
    secondary: NothingColors.scarlet,
    surface: NothingColors.black,
    error: Colors.red,
    onPrimary: NothingColors.paleGrey,
    onSecondary: NothingColors.paleGrey,
    onSurface: NothingColors.paleGrey,
    onError: Colors.white,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: NothingColors.almostBlack,
    surfaceTintColor: NothingColors.almostBlack,
    elevation: 0,
    iconTheme: IconThemeData(color: NothingColors.paleGrey),
    titleTextStyle: TextStyle(color: NothingColors.paleGrey, fontSize: 20),
  ),
  dialogTheme: const DialogThemeData(
    backgroundColor: NothingColors.black,
    surfaceTintColor: Colors.transparent,
  ),
  cardColor: NothingColors.black,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: NothingColors.scarlet,
    foregroundColor: NothingColors.paleGrey,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: NothingColors.black,
    selectedItemColor: NothingColors.paleGrey,
    unselectedItemColor: Colors.white70,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(color: NothingColors.paleGrey),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF444444)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: NothingColors.scarlet),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: NothingColors.paleGrey,
      backgroundColor: NothingColors.darkGrey,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: NothingColors.scarlet,
      foregroundColor: NothingColors.paleGrey,
    ),
  ),
  textTheme: const TextTheme(
    headlineSmall: TextStyle(
      color: NothingColors.paleGrey,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(color: Color(0xFFB0B0B0)),
  ),
  dividerColor: Color(0xFF444444),
  hoverColor: interactive ? null : Colors.transparent,
  splashColor: interactive ? null : Colors.transparent,
  highlightColor: interactive ? null : Colors.transparent,
);