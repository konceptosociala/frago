import 'dart:collection';

import 'package:flutter/material.dart';

enum ScreenId { 
  posts, 
  workspace, 
  media, 
  profile;

  static ScreenId fromIndex(int index) {
    switch (index) {
      case 0:
        return ScreenId.posts;
      case 1:
        return ScreenId.workspace;
      case 3:
        return ScreenId.media;
      case 4:
        return ScreenId.profile;
      default:
        throw ArgumentError('Invalid index for ScreenId: $index');
    }
  }

  int toIndex() {
    switch (this) {
      case ScreenId.posts:
        return 0;
      case ScreenId.workspace:
        return 1;
      case ScreenId.media:
        return 3;
      case ScreenId.profile:
        return 4;
    }
  }
}

class Screens {
  final Map<ScreenId, Widget> _screens = HashMap<ScreenId, Widget>();

  void insert(ScreenId id, Widget screen) {
    _screens[id] = screen;
  }

  Widget? get(ScreenId id) {
    return _screens[id];
  }
}
