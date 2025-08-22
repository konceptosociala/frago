import 'dart:convert';

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
  final String token;

  LoggedUser({required this.name, required this.token});

  factory LoggedUser.fromJson(String json) {
    final data = jsonDecode(json);
    return LoggedUser(
      name: data['name'],
      token: data['token'],
    );
  }

  String toJson() {
    return jsonEncode({
      'name': name,
      'token': token,
    });
  }
}

class UninitializedGitError extends StateError {
  UninitializedGitError()
    : super('Git instance is uninitialized; call Git.init() first');
}