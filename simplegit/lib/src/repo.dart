import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:option_result/option_result.dart';
import 'package:simplegit/src/bindings/simplegit.dart';
import 'package:simplegit/src/error.dart';
import 'package:simplegit/src/sys.dart';

class RemoteRepository {
  final String name;
  final String url;

  RemoteRepository({required this.name, required this.url});
}

class LocalRepository {
  static final _finalizer = Finalizer<Pointer<git_repository>>((repo) {
    calloc.free(repo);
  });

  Pointer<git_repository> inner;

  LocalRepository._internal(this.inner);

  static Result<LocalRepository, GitError> open(String path) {
    var out = calloc<Pointer<git_repository>>();
    var pathPtr = path.toNativeUtf8();

    try {
      var result = gitSys.git_repository_open(out, pathPtr.cast<Char>());

      if (result != 0) {
        return Err(GitError(kind: GitErrorKind.openRepo, msg: path));
      }

      var repo = out.value;
      var wrapper = LocalRepository._internal(repo);
      _finalizer.attach(wrapper, repo, detach: wrapper);

      return Ok(wrapper);
    } finally {
      calloc.free(out);
      malloc.free(pathPtr);
    }
  }
}
