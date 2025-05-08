import 'dart:io';

import 'package:flutter/material.dart';

class NothingColors {
  NothingColors._();

  static const scarlet = Color(0xFFD71921);
  static const almostBlack = Color(0xFF1A1D1C);
  static const paleGrey = Color(0xFFFCFAFE);
  static const black = Color(0xFF101012);
}

class Utils {
  Utils._();

  static const debugPhoneSize = Size(460, 870);

  static bool isDesktop() => Platform.isLinux || Platform.isWindows || Platform.isMacOS;
}