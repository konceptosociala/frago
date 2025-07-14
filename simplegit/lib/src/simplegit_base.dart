import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:option_result/option_result.dart';
import 'package:simplegit/src/error.dart';
import 'package:simplegit/src/push.dart';
import 'package:simplegit/src/repo.dart';
import 'package:simplegit/src/sys.dart';
import 'package:simplegit/src/utils.dart';

class Git {
  /// Singleton instance of [Git].
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

  static GitPush push() {
    if (!_initialized) {
      throw UninitializedGitError();
    }

    return GitPush();
  }

  static Result<List<RemoteRepository>, GitError> repos(LoggedUser user) {
    throw 'Not implemented';
  }
}
