import 'dart:io';

import 'package:flutter/material.dart';

class NothingColors {
  NothingColors._();

  static const scarlet = Color(0xFFD71921);
  static const almostBlack = Color(0xFF1C1C1D);
  static const darkGrey = Color(0xFF2f3332);
  static const paleGrey = Color(0xFFF1F1FE);
  static const black = Color(0xFF111112);
}

class Utils {
  Utils._();

  static const debugPhoneSize = Size(460, 870);

  static bool isDesktop() =>
      Platform.isLinux || Platform.isWindows || Platform.isMacOS;
}