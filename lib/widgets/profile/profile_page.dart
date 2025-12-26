import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart' show TaskEither;
import 'package:frago/widgets/general/bg_body.dart';
import 'package:frago/widgets/general/gaps.dart';
import 'package:frago/widgets/login/misc.dart';
import 'package:simplegit/simplegit.dart';

class ProfilePage extends StatelessWidget {
  final LoggedUser user;
  final VoidCallback onLogout;

  const ProfilePage({super.key, required this.user, required this.onLogout});

  @override
  Widget build(BuildContext context) => BackgroundBody(
    svgPath: 'assets/svg/bg.svg',
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 27.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Login: ${user.name}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            'Token: ${_shortenToken(user.token)}',
            style: Theme.of(context).textTheme.titleMedium,
          ),

          GapV(20),

          TextButton(
            child: Text('Test git'),
            onPressed:
                () async => (await _testGit(user.token).run()).match(
                  (error) => print('ERROR: $error'),
                  (_) => print('Success'),
                ),
          ),

          LoginButton(label: 'Log Out', onPressed: onLogout),
        ],
      ),
    ),
  );

  String _shortenToken(String token) {
    if (token.length <= 10) return token;
    final start = token.substring(0, 6);
    final end = token.substring(token.length - 4);
    return '$start*******$end';
  }
}

TaskEither<GitError, void> _testGit(String token) => TaskEither.Do(($) async {
  if (Directory('frago-test-repo').existsSync()) {
    Directory('frago-test-repo').deleteSync(recursive: true);
  }

  final repo = await $(
    Git.clone(
      url: "https://github.com/konceptosociala/frago-test-repo",
      path: "frago-test-repo",
      branch: "main",
    ).perform(),
  );

  final file = File("frago-test-repo/hello.txt");
  await file.writeAsString("Hello world");

  await $(Git.add(repo: repo, path: "hello.txt").perform());

  await $(
    Git.commit(
      repo: repo,
      message: "Add hello.txt",
      authorName: "Frago Tester",
      authorEmail: "frago@test.com",
    ).perform(),
  );

  await $(
    Git.push(
      remotePath: "origin",
      repo: repo,
      branch: "main",
      username: "konceptosociala",
      token: token,
    ).perform(),
  );
});
