import 'package:flutter/material.dart';
import 'package:frago/utils/utils.dart';
import 'package:frago/widgets/login/intro.dart';
import 'package:simplegit/src/utils.dart' show LoggedUser;

class LoginPage extends StatelessWidget {
  final void Function(LoggedUser user)? onLogin;

  const LoginPage({super.key, this.onLogin});

  @override
  Widget build(BuildContext context) {
    return Intro(onLogin: onLogin);
  }
}

class LoginHeading extends StatelessWidget {
  const LoginHeading({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 32,
        color: NothingColors.paleGrey,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const LoginButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: NothingColors.scarlet,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      ),
      child: Text(
        label,
        style: TextStyle(color: NothingColors.paleGrey, fontSize: 18),
      ),
    );
  }
}

class LoginError {
  final LoginErrorKind kind;
  final String? message;

  LoginError({required this.kind, this.message});

  @override
  String toString() {
    return message != null ? '${kind.toString()}: $message' : kind.toString();
  }
}

enum LoginErrorKind {
  fetchGithubUser,
  githubError,
  expiredToken,
  cannotResolve,
  requestDevice,
  openUrl,
  jsonDecode,
  invalidUrl;

  @override
  String toString() {
    switch (this) {
      case LoginErrorKind.jsonDecode:
        return 'Cannot decode JSON data';
      case LoginErrorKind.fetchGithubUser:
        return 'Failed to fetch GitHub user';
      case LoginErrorKind.invalidUrl:
        return 'Invalid URL';
      case LoginErrorKind.githubError:
        return 'GitHub API error';
      case LoginErrorKind.expiredToken:
        return 'The authorization code has expired';
      case LoginErrorKind.cannotResolve:
        return 'Cannot resolve `github.com`';
      case LoginErrorKind.requestDevice:
        return 'Failed to request device code';
      case LoginErrorKind.openUrl:
        return 'Failed to open verification URL';
    }
  }
}

void showError(NavigatorState nav, LoginError error) {
  showDialog(
    context: nav.context,
    builder:
        (context) => AlertDialog(
          title: Text('Error'),
          content: Text(error.toString()),
          actions: [TextButton(onPressed: () => nav.pop(), child: Text('OK'))],
        ),
  );
}
