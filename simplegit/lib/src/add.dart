import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:fpdart/fpdart.dart';
import 'package:simplegit/src/bindings/simplegit.dart';
import 'package:simplegit/src/error.dart';
import 'package:simplegit/src/repo.dart';
import 'package:simplegit/src/sys.dart';

class GitAdd {
  LocalRepository repo;
  String path;

  GitAdd({required this.repo, required this.path});

  TaskEither<GitError, void> perform() => TaskEither(() async {
    final indexPtr = calloc<Pointer<git_index>>();
    final pathPtr = path.toNativeUtf8().cast<Char>();

    try { 
      final errIndex = gitSys.git_repository_index(indexPtr, repo.inner);
      if (errIndex != 0) {
        return Left(GitError(kind: GitErrorKind.indexError));
      }

      final index = indexPtr.value;

      final errAdd = gitSys.git_index_add_bypath(index, pathPtr);
      if (errAdd != 0) {
        return Left(GitError(kind: GitErrorKind.addError, msg: path));
      }

      final errWrite = gitSys.git_index_write(index);
      if (errWrite != 0) {
        return Left(GitError(kind: GitErrorKind.indexWriteError));
      }

      return Right(null);
    } finally {
      calloc.free(indexPtr);
      malloc.free(pathPtr);
    }
  });
}