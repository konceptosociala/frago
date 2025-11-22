import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart';
import 'package:frago/utils/utils.dart';
import 'package:frago/widgets/login/misc.dart';
import 'package:http/http.dart' as http;
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:simplegit/simplegit.dart';
import 'package:url_launcher/url_launcher.dart';

class ConfirmLogin extends StatelessWidget {
  final String deviceCode;
  final String userCode;
  final String verificationUri;

  const ConfirmLogin({
    super.key,
    required this.userCode,
    required this.verificationUri,
    required this.deviceCode,
  });

  @override
  Widget build(BuildContext context) {
    final nav = Navigator.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please confirm your\n'
              'login on GitHub:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, color: NothingColors.paleGrey),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginHeading(label: userCode),

                gapH(8),

                IconButton(
                  icon: Icon(PhosphorIcons.copy()),
                  color: NothingColors.paleGrey,
                  tooltip: 'Copy code',
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: userCode));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Code copied to clipboard')),
                    );
                  },
                ),
              ],
            ),

            gapV(20),

            LoginButton(
              label: 'Confirm', 
              onPressed: () => confirmLogin(
                nav,
                verificationUri,
                deviceCode,
              )
            ),

            gapV(20),

            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                nav.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}

void confirmLogin(
  NavigatorState nav, 
  String verificationUri,
  String deviceCode,
) async {
    final openResult = await openConfirmPage(verificationUri).run();

    if (openResult case Left(value: final error)) {
      nav.pop();
      showError(nav, error);
      return;
    }

    final tokenResult = await pollForToken(
      clientId: 'Ov23liexZonCeMBDUUKX',
      deviceCode: deviceCode,
    ).run();

    if (tokenResult case Left(value: final error)) {
      nav.pop();
      showError(nav, error);
      return;
    }

    final token = tokenResult.getOrElse((_) => throw 'Unreachable');

    log('Obtained token: $token');

    final userResult = await fetchGitHubUser(token).run();

    if (userResult case Left(value: final error)) {
      nav.pop();
      showError(nav, error);
      return;
    }

    final login = userResult.getOrElse((_) => throw 'Unreachable');

    log('Obtained user: $login');

    final user = LoggedUser(name: login, token: token);

    nav.pop(user);
  }

TaskEither<LoginError, void> openConfirmPage(String url) => TaskEither.Do(
  ($) async {
    final uri = await $(
      parseUri(url)
        .toEither(() => LoginError(kind: LoginErrorKind.invalidUrl))
        .toTaskEither()
    );

    final canLaunchUrl = await $(canLaunch(uri).toTaskEither());

    if (canLaunchUrl) {
      await $(launch(uri));
    }
  }
);

TaskEither<LoginError, String> fetchGitHubUser(String token) => TaskEither
  .tryCatch(
    () async => await http.get(
      Uri.parse('https://api.github.com/user'),
      headers: {
        'Authorization': 'token $token',
        'Accept': 'application/vnd.github.v3+json',
      },
    ),
    (_, __) => LoginError(kind: LoginErrorKind.cannotResolve),
  )
  .filterOrElse(
    (r) => r.statusCode == 200, 
    (_) => LoginError(kind: LoginErrorKind.cannotResolve)
  )
  .flatMap((r) => Either
    .tryCatch(
      () => jsonDecode(r.body) as Map<String, dynamic>,
      (_, __) => LoginError(kind: LoginErrorKind.jsonDecode),
    )
    .toTaskEither()
  )
  .filterOrElse(
    (data) => data.containsKey('login'),
    (_) => LoginError(kind: LoginErrorKind.fetchGithubUser),
  )
  .map((data) => data['login']! as String);

TaskEither<LoginError, String> pollForToken({
  required String clientId,
  required String deviceCode,
  int interval = 5
}) => TaskEither.Do(
  ($) async {
    await Future.delayed(Duration(seconds: interval));

    final data = await $(accessToken(
      clientId: clientId, 
      deviceCode: deviceCode
    ));

    if (data.containsKey('access_token')) {
      return data['access_token']!;
    } else {
      return switch (data['error']) {
        'authorization_pending' => $(pollForToken(
          clientId: clientId,
          deviceCode: deviceCode
        )),

        'slow_down' => $(pollForToken(
          clientId: clientId,
          deviceCode: deviceCode,
          interval: int.parse(data['interval']!),
        )),

        'expired_token' => $(TaskEither.left(
          LoginError(kind: LoginErrorKind.expiredToken)
        )),

        _ => $(TaskEither.left(
          LoginError(
            kind: LoginErrorKind.githubError, 
            message: data['error']
          )
        )),
      };
    }
  }
);

TaskEither<LoginError, Map<String, dynamic>> accessToken({
  required String clientId,
  required String deviceCode,
}) => TaskEither
  .tryCatch(
    () async => await http.post(
      Uri.parse('https://github.com/login/oauth/access_token'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: 'client_id=$clientId&device_code=$deviceCode&grant_type=urn:ietf:params:oauth:grant-type:device_code',
    ),
    (_, __) => LoginError(kind: LoginErrorKind.cannotResolve),
  )
  .filterOrElse(
    (r) => r.statusCode == 200, 
    (_) => LoginError(kind: LoginErrorKind.cannotResolve)
  )
  .flatMap((r) => Either
    .tryCatch(
      () => Uri.splitQueryString(r.body),
      (_, __) => LoginError(kind: LoginErrorKind.githubError)
    )
    .toTaskEither()
  );

TaskEither<LoginError, void> launch(Uri uri) => TaskEither.tryCatch(
  () async => launchUrl(uri, mode: LaunchMode.externalApplication),
  (_, __) => LoginError(kind: LoginErrorKind.openUrl),
);

Task<bool> canLaunch(Uri uri) => Task(() async => canLaunchUrl(uri));