import 'package:flutter/material.dart';
import 'package:frago/utils/utils.dart';

class FragoThemeData {
  FragoThemeData._();

  static ThemeData dark({bool interactive = true}) => ThemeData(
    fontFamily: 'FiraSans',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: NothingColors.almostBlack,
    primaryColor: NothingColors.scarlet,
    appBarTheme: const AppBarTheme(
      backgroundColor: NothingColors.almostBlack,
      elevation: 0,
      iconTheme: IconThemeData(color: NothingColors.paleGrey),
      titleTextStyle: TextStyle(color: NothingColors.paleGrey, fontSize: 20),
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
    textTheme: const TextTheme(
      headlineSmall: TextStyle(color: NothingColors.paleGrey, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: Color(0xFFB0B0B0)),
    ),
    dividerColor: Color(0xFF444444),
    hoverColor: interactive 
      ? null 
      : Colors.transparent,
    splashColor: interactive 
      ? null 
      : Colors.transparent,
    highlightColor: interactive 
      ? null 
      : Colors.transparent,
  );
}