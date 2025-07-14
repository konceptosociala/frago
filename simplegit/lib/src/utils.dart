import 'package:option_result/result.dart';
import 'package:simplegit/src/error.dart';

class Version {
  final int major;
  final int minor;
  final int patch;

  Version(this.major, this.minor, this.patch);

  @override
  String toString() {
    return 'v$major.$minor.$patch';
  }
}

class LoggedUser {
  final String name;
  final String email;
  final String token;

  LoggedUser._(this.name, this.email, this.token);

  static Result<LoggedUser, GitError> auth() {
    return Err(
      GitError(
        kind: GitErrorKind.githubAuth,
        msg: ''
      )
    );
  }
}

class UninitializedGitError extends StateError {
  UninitializedGitError()
    : super('Git instance is uninitialized; call Git.init() first');
}