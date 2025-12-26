import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

Option<T> getJsonFromPrefs<T>({
  required SharedPreferences prefs,
  required String key,
  required T Function(Map<String, dynamic>) fromJson
}) => Option.fromNullable(prefs.getString(key))
  .flatMap((json) {
    final wsMap = jsonDecode(json);
    if (wsMap is Map<String, dynamic>) {
      return Some(wsMap);
    } else {
      return Option.none();
    }
  })
  .flatMap((map) => Option.tryCatch(() => fromJson(map)));