import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:fpdart/fpdart.dart';
import 'package:simplegit/src/bindings/simplegit.dart';
import 'package:simplegit/src/error.dart';
import 'package:simplegit/src/repo.dart';
import 'package:simplegit/src/sys.dart';

class GitClone {
  final String url;
  final String path;
  final String branch;

  GitClone({required this.url, required this.path, required this.branch});

  TaskEither<GitError, LocalRepository> perform() => TaskEither(() async {
    var repo = calloc<Pointer<git_repository>>();
    var cloneOptions = calloc<git_clone_options>();
    
    gitSys.git_clone_options_init(cloneOptions, GIT_CLONE_OPTIONS_VERSION);
    
    cloneOptions.ref.checkout_branch = branch.toNativeUtf8().cast<Char>();

    int error = gitSys.git_clone(
      repo,
      url.toNativeUtf8().cast<Char>(),
      path.toNativeUtf8().cast<Char>(),
      cloneOptions,
    );

    calloc.free(cloneOptions);

    if (error == 0) {
      var localRepo = LocalRepository.fromRaw(repo.value);
      return Right(localRepo);
    } else {
      return Left(GitError(kind: GitErrorKind.cloneError, msg: url));
    }
  });
}