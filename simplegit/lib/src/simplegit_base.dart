import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';
import 'package:simplegit/src/bindings/simplegit.dart';

DynamicLibrary _loadLibGit2() {
  if (Platform.isLinux) {
    return DynamicLibrary.open('simplegit/build-linux/install/lib/libgit2.so');
  } else if (Platform.isAndroid) {
    return DynamicLibrary.open('libgit2.so'); // bundled in APK/jniLibs
  } else {
    throw UnsupportedError('Platform not supported');
  }
}

String version() {
  final lib = SimpleGitSys(_loadLibGit2());

  // Initialize libgit2
  lib.git_libgit2_init();

  // Get libgit2 version numbers
  final major = calloc<Int>();
  final minor = calloc<Int>();
  final rev = calloc<Int>();

  lib.git_libgit2_version(major, minor, rev);

  String res = 'libgit2 version: ${major.value}.${minor.value}.${rev.value}';

  // Cleanup
  lib.git_libgit2_shutdown();

  calloc.free(major);
  calloc.free(minor);
  calloc.free(rev);

  return res;
}
