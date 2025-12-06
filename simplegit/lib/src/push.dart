import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:fpdart/fpdart.dart';
import 'package:simplegit/src/bindings/simplegit.dart';
import 'package:simplegit/src/error.dart';
import 'package:simplegit/src/repo.dart';
import 'package:simplegit/src/sys.dart';

class GitPush {
  final LocalRepository repo;
  final String remotePath;
  final String branch;
  final String username;
  final String token;

  GitPush({
    required this.repo,
    required this.remotePath,
    required this.branch,
    required this.username,
    required this.token,
  });

  TaskEither<GitError, void> perform() => TaskEither(() async {
    final refspecs = ['refs/heads/$branch:refs/heads/$branch'];
    final remotePtr = calloc<Pointer<git_remote>>();
    final optionsPtr = calloc<git_push_options>();
    final stringsPtr = calloc<Pointer<Char>>(refspecs.length);
    final remoteNamePtr = remotePath.toNativeUtf8().cast<Char>();

    for (int i = 0; i < refspecs.length; i++) {
      stringsPtr[i] = refspecs[i].toNativeUtf8().cast<Char>();
    }

    final gitArray = calloc<git_strarray>();
    gitArray.ref.strings = stringsPtr;
    gitArray.ref.count = refspecs.length;

    Pointer<Char>? usernamePtr;
    Pointer<Char>? tokenPtr;

    try {
      final lookup = gitSys.git_remote_lookup(
        remotePtr,
        repo.inner,
        remoteNamePtr,
      );

      if (lookup != 0) {
        return Left(
          GitError(kind: GitErrorKind.invalidRemote, msg: remotePath),
        );
      }

      gitSys.git_push_options_init(optionsPtr, GIT_PUSH_OPTIONS_VERSION);

      usernamePtr = username.toNativeUtf8().cast<Char>();
      tokenPtr = token.toNativeUtf8().cast<Char>();

      _storeCredentials(usernamePtr, tokenPtr);

      optionsPtr.ref.callbacks.credentials =
        Pointer.fromFunction<git_credential_acquire_cbFunction>(
          _credentialCallback,
          -1,
        );
        
      final pushResult = gitSys.git_remote_push(
        remotePtr.value,
        gitArray,
        optionsPtr,
      );

      if (pushResult != 0) {
        final errorPtr = gitSys.git_error_last();
        String errorMsg = remotePath;
        if (errorPtr != nullptr) {
          final errorStruct = errorPtr.ref;
          if (errorStruct.message != nullptr) {
            errorMsg = errorStruct.message.cast<Utf8>().toDartString();
          }
        }
        return Left(GitError(kind: GitErrorKind.pushError, msg: errorMsg));
      }

      return const Right(null);
    } finally {
      _clearCredentials();

      calloc.free(remotePtr);
      malloc.free(remoteNamePtr);

      if (usernamePtr != null) malloc.free(usernamePtr);
      if (tokenPtr != null) malloc.free(tokenPtr);

      for (int i = 0; i < refspecs.length; i++) {
        malloc.free(stringsPtr[i]);
      }

      calloc.free(stringsPtr);
      calloc.free(gitArray);
      calloc.free(optionsPtr);
    }
  });
}

Pointer<Char>? _globalUsername;
Pointer<Char>? _globalToken;

void _storeCredentials(Pointer<Char> username, Pointer<Char> token) {
  _globalUsername = username;
  _globalToken = token;
}

void _clearCredentials() {
  _globalUsername = null;
  _globalToken = null;
}

int _credentialCallback(
  Pointer<Pointer<git_credential>> out,
  Pointer<Char> url,
  Pointer<Char> usernameFromUrl,
  int allowedTypes,
  Pointer<Void> payload,
) {
  if (_globalUsername == null || _globalToken == null) {
    return -1;
  }

  final result = gitSys.git_credential_userpass_plaintext_new(
    out,
    _globalUsername!,
    _globalToken!,
  );

  return result;
}
