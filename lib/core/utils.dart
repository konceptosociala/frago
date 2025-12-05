import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';

const debugPhoneSize = Size(460, 870);

bool isDesktop() 
  => Platform.isLinux 
  || Platform.isWindows 
  || Platform.isMacOS;

Option<Uri> parseUri(String url) => Option.tryCatch(() => Uri.parse(url));

void ok() {}

void postFrame(VoidCallback callback) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    callback();
  });
}