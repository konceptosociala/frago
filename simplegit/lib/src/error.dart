enum GitErrorKind {
  repoNotSet,
  remoteNotSet,
  openRepo,
  invalidRemote,
  connectionError,
  pushError;

  @override
  String toString() {
    switch (this) {
      case GitErrorKind.repoNotSet:
        return 'Repository is not set';
      case GitErrorKind.remoteNotSet:
        return 'Remote is not set';
      case GitErrorKind.openRepo:
        return 'Cannot open repository';
      case GitErrorKind.invalidRemote:
        return 'Invalid remote';
      case GitErrorKind.connectionError:
        return 'Connection error';
      case GitErrorKind.pushError:
        return 'Cannot push to remote';
    }
  }
}

class GitError {
  final GitErrorKind kind;
  final String? msg;

  GitError({required this.kind, this.msg});

  @override
  String toString() {
    if (msg != null) {
      return '$kind: $msg';
    } else {
      return kind.toString();
    }
  }
}
