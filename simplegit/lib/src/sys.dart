import 'dart:ffi';
import 'dart:io';
import 'package:simplegit/src/bindings/simplegit.dart';
import 'package:ffi/ffi.dart';

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

Pointer<git_strarray> createRefspecs(List<String> strings) {
  final strarrayPtr = calloc<git_strarray>(sizeOf<git_strarray>());
  final ptrs = calloc<Pointer<Utf8>>(sizeOf<Pointer<Utf8>>() * strings.length);

  for (var i = 0; i < strings.length; i++) {
    ptrs[i] = strings[i].toNativeUtf8();
  }

  strarrayPtr.ref.strings = ptrs.cast<Pointer<Char>>();
  strarrayPtr.ref.count = strings.length;

  return strarrayPtr;
}
