import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';

class NothingColors {
  NothingColors._();

  static const scarlet = Color(0xFFD71921);
  static const almostBlack = Color(0xFF1C1C1D);
  static const darkGrey = Color(0xFF2f3332);
  static const paleGrey = Color(0xFFF1F1FE);
  static const black = Color(0xFF111112);
}

const debugPhoneSize = Size(460, 870);

bool isDesktop() 
  => Platform.isLinux 
  || Platform.isWindows 
  || Platform.isMacOS;

Option<Uri> parseUri(String url) => Option.tryCatch(() => Uri.parse(url));

void ok() {}