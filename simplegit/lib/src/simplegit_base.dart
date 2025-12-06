import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:fpdart/fpdart.dart';
import 'package:simplegit/src/add.dart';
import 'package:simplegit/src/clone.dart';
import 'package:simplegit/src/commit.dart';
import 'package:simplegit/src/error.dart';
import 'package:simplegit/src/push.dart';
import 'package:simplegit/src/repo.dart';
import 'package:simplegit/src/sys.dart';
import 'package:simplegit/src/utils.dart';

class Git {
  static bool _initialized = false;

  static void init() {
    if (!_initialized) {
      gitSys.git_libgit2_init();
      _initialized = true;
    }
  }

  static void shutdown() {
    if (_initialized) {
      gitSys.git_libgit2_shutdown();
      _initialized = false;
    }
  }

  static GitPush push({
    required String remotePath,
    required LocalRepository repo,
    required String branch,
    required String username,
    required String token,
  }) {
    if (!_initialized) {
      throw UninitializedGitError();
    }

    return GitPush(
      remotePath: remotePath,
      repo: repo,
      branch: branch,
      username: username,
      token: token,
    );
  }

  static GitClone clone({
    required String url, 
    required String path,
    required String branch,
  }) {
    if (!_initialized) {
      throw UninitializedGitError();
    }

    return GitClone(url: url, path: path, branch: branch);
  }

  static GitAdd add({required LocalRepository repo, required String path}) {
    if (!_initialized) {
      throw UninitializedGitError();
    }

    return GitAdd(repo: repo, path: path);
  }

  static GitCommit commit({
    required LocalRepository repo,
    required String message,
    required String authorName,
    required String authorEmail,
  }) {
    if (!_initialized) {
      throw UninitializedGitError();
    }

    return GitCommit(
      repo: repo,
      message: message,
      authorName: authorName,
      authorEmail: authorEmail,
    );
  }

  static TaskEither<List<RemoteRepository>, GitError> repos(LoggedUser user) {
    throw 'Not implemented';
  }

  static Version version() {
    if (!_initialized) {
      throw UninitializedGitError();
    }

    final major = calloc<Int>();
    final minor = calloc<Int>();
    final rev = calloc<Int>();

    gitSys.git_libgit2_version(major, minor, rev);

    var res = Version(major.value, minor.value, rev.value);

    calloc.free(major);
    calloc.free(minor);
    calloc.free(rev);

    return res;
  }
}
