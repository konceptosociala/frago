enum GitErrorKind {
  openRepo,
  invalidRemote,
  connectionError,
  pushError, 
  cloneError,
  addError,
  indexError,
  indexWriteError,
  commitError,
  treeLookupError,
  parentLookupError,
  signatureError,
  treeWriteError,
  remoteAddError;

  @override
  String toString() {
    return switch (this) {
      GitErrorKind.openRepo         => 'Cannot open repository',
      GitErrorKind.invalidRemote    => 'Invalid remote',
      GitErrorKind.connectionError  => 'Connection error',
      GitErrorKind.pushError        => 'Cannot push to remote',
      GitErrorKind.cloneError       => 'Cannot clone repository',
      GitErrorKind.addError         => 'Cannot add files to repository',
      GitErrorKind.indexError       => 'Cannot access repository index',
      GitErrorKind.indexWriteError  => 'Cannot write to repository index',
      GitErrorKind.commitError      => 'Cannot create commit',
      GitErrorKind.treeLookupError  => 'Cannot lookup tree object',
      GitErrorKind.parentLookupError=> 'Cannot lookup parent commit',
      GitErrorKind.signatureError   => 'Cannot create signature',
      GitErrorKind.treeWriteError   => 'Cannot write tree object',
      GitErrorKind.remoteAddError   => 'Cannot add remote',
    };
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
