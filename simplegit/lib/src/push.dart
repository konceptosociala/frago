import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:option_result/option_result.dart';
import 'package:simplegit/src/bindings/simplegit.dart';
import 'package:simplegit/src/error.dart';
import 'package:simplegit/src/repo.dart';
import 'package:simplegit/src/sys.dart';

class GitPush {
  LocalRepository? _repo;
  String? _remote;

  GitPush repo(LocalRepository repo) {
    _repo = repo;
    return this;
  }

  GitPush remote(String remote) {
    _remote = remote;
    return this;
  }

  Result<(), GitError> perform() {
    if (_repo == null) {
      return Err(GitError(kind: GitErrorKind.repoNotSet));
    }

    if (_remote == null) {
      return Err(GitError(kind: GitErrorKind.remoteNotSet));
    }

    var refspecs = createRefspecs(['refs/heads/main:refs/heads/main']);
    var remote = calloc<Pointer<git_remote>>();
    var options = calloc<git_push_options>();

    var repoPtr = _repo!.inner;
    var remoteName = _remote!.toNativeUtf8().cast<Char>();

    try {
      var lookupResult = gitSys.git_remote_lookup(remote, repoPtr, remoteName);
      if (lookupResult != 0) {
        return Err(GitError(kind: GitErrorKind.invalidRemote, msg: _remote));
      }

      gitSys.git_push_options_init(options, GIT_PUSH_OPTIONS_VERSION);
      // options.ref.callbacks.credentials = cred_cb;

      var pushResult = gitSys.git_remote_push(remote.value, refspecs, options);
      if (pushResult != 0) {
        return Err(GitError(kind: GitErrorKind.pushError, msg: _remote));
      }
    } finally {
      calloc.free(remote);
      malloc.free(remoteName);
      malloc.free(refspecs.ref.strings);
      calloc.free(refspecs);
      calloc.free(options);
    }

    return Ok(());
  }
}
