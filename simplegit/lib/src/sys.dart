import 'dart:ffi';
import 'dart:io';
import 'package:simplegit/src/bindings/simplegit.dart';

final GitSys gitSys = _initGitLib();

GitSys _initGitLib() {
  DynamicLibrary lib;
  if (Platform.isLinux) {
    lib = DynamicLibrary.open('simplegit/build-linux/install/lib/libgit2.so');
  } else if (Platform.isAndroid) {
    lib = DynamicLibrary.open('libgit2.so'); // bundled in APK/jniLibs
  } else {
    throw UnsupportedError('Platform not supported');
  }
  
  return GitSys(lib);
}