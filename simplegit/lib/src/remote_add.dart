import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:fpdart/fpdart.dart';
import 'package:simplegit/src/bindings/simplegit.dart';
import 'package:simplegit/src/repo.dart';
import 'package:simplegit/src/sys.dart';

import 'error.dart';

class GitRemoteAdd {
  final LocalRepository repo;
  final String name;
  final String url;

  GitRemoteAdd({
    required this.repo,
    required this.name,
    required this.url,
  });

  TaskEither<GitError, void> perform() => TaskEither(() async {
    final remotePtr = calloc<Pointer<git_remote>>();
    final namePtr = name.toNativeUtf8().cast<Char>();
    final urlPtr = url.toNativeUtf8().cast<Char>();

    try {
      final lookup = gitSys.git_remote_lookup(
        remotePtr,
        repo.inner,
        namePtr,
      );
      
      if (lookup == 0) {
        return Right(null); // Remote already exists
      }

      final err = gitSys.git_remote_create(
        remotePtr,
        repo.inner,
        namePtr,
        urlPtr,
      );

      if (err != 0) {
        return Left(
          GitError(
            kind: GitErrorKind.remoteAddError,
            msg: url,
          ),
        );
      }

      return Right(null);
    } finally {
      calloc.free(remotePtr);
      malloc.free(namePtr);
      malloc.free(urlPtr);
    }
  });
}