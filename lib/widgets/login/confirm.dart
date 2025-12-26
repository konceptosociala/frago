import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart';
import 'package:frago/models/access_token_info.dart';
import 'package:frago/models/verification_info.dart';
import 'package:frago/core/utils.dart';
import 'package:frago/widgets/general/gaps.dart';
import 'package:frago/widgets/login/misc.dart';
import 'package:frago/core/colors.dart';
import 'package:http/http.dart' as http;
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:simplegit/simplegit.dart';
import 'package:url_launcher/url_launcher.dart';

class ConfirmLogin extends StatelessWidget {
  final VerificationInfo info;

  const ConfirmLogin({
    super.key,
    required this.info,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ConfirmTitle(),
          ConfirmCodeRow(info.userCode),

          const GapV(20),

          ConfirmButton(
            deviceCode: info.deviceCode,
            verificationUri: info.verificationUri,
          ),

          const GapV(20),

          CancelButton(),
        ],
      ),
    ),
  );
}

class CancelButton extends StatelessWidget {
  const CancelButton({super.key});

  @override
  Widget build(BuildContext context) => TextButton(
    child: Text('Cancel'),
    onPressed: () => Navigator.of(context).pop(),
  );
}

class ConfirmButton extends StatelessWidget {
  final String verificationUri;
  final String deviceCode;

  const ConfirmButton({
    super.key, 
    required this.verificationUri,
    required this.deviceCode,
  });

  @override
  Widget build(BuildContext context) => LoginButton(
    label: 'Confirm',
    onPressed: () => proceedConfirm(context),
  );

  void proceedConfirm(BuildContext context) async {
    final result = 
      await confirmLogin(verificationUri, deviceCode).run();

    result.match(
      (error) {
        if (!context.mounted) {
          return;
        }

        final navigator = Navigator.of(context);

        navigator.pop();
        showError(navigator, error);
      },
      (user) {
        if (!context.mounted) {
          return;
        }

        Navigator.of(context).pop(user);
      },
    );
  }
}

class ConfirmTitle extends StatelessWidget {
  const ConfirmTitle({super.key});

  @override
  Widget build(BuildContext context) => const Text(
    'Please confirm your\n'
    'login on GitHub:',

    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 24, color: NothingColors.paleGrey),
  );
}

class ConfirmCodeRow extends StatelessWidget {
  final String userCode;

  const ConfirmCodeRow(this.userCode, {super.key});

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      LoginHeading(label: userCode),
      GapH(8),
      IconButton(
        icon: Icon(PhosphorIcons.copy()),
        color: NothingColors.paleGrey,
        tooltip: 'Copy code',
        onPressed: () {
          Clipboard.setData(ClipboardData(text: userCode));
          ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Code copied to clipboard')));
        },
      ),
    ],
  );
}

TaskEither<LoginError, LoggedUser> confirmLogin(
  String verificationUri,
  String deviceCode,
) => TaskEither.Do(
  ($) async {
    await $(openConfirmPage(verificationUri));

    final token = await $(pollForToken(
      clientId: 'Ov23liexZonCeMBDUUKX',
      deviceCode: deviceCode,
    ));

    final login = await $(fetchGitHubUser(token));

    return LoggedUser(name: login, token: token);
  }
);

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

    final accessTokenInfo = await $(accessToken(
      clientId: clientId, 
      deviceCode: deviceCode
    ));

    return switch (accessTokenInfo) {
      Token(token: final token) => token,

      Error(err: final err) => switch (err) {
        AuthPending() => $(pollForToken(
          clientId: clientId,
          deviceCode: deviceCode
        )),

        SlowDown(interval: final interval) => $(pollForToken(
          clientId: clientId,
          deviceCode: deviceCode,
          interval: interval,
        )),

        ExpiredToken() => $(TaskEither.left(
          LoginError(kind: LoginErrorKind.expiredToken)
        )),

        InvalidError(err: final err) => $(TaskEither.left(
          LoginError(
            kind: LoginErrorKind.githubError, 
            message: err,
          )
        ))
      }
    };
  }
);

TaskEither<LoginError, AccessTokenInfo> accessToken({
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
  )
  .filterOrElse(
    (data) => ['access_token', 'error'].any((k) => data.containsKey(k)),
    (_) => LoginError(kind: LoginErrorKind.fetchGithubUser),
  )
  .map((data) {
    if (data.containsKey('access_token')) {
      return AccessTokenInfo.token(data['access_token']!);
    } else {
      return switch (data['error']) {
        'authorization_pending' => AccessTokenInfo.error(
          AccessTokenError.authPending()
        ),

        'slow_down' => AccessTokenInfo.error(
          AccessTokenError.slowDown(int.parse(data['interval']!))
        ),

        'expired_token' => AccessTokenInfo.error(
          AccessTokenError.expired()
        ),

        final other => AccessTokenInfo.error(
          AccessTokenError.invalid(other ?? "invalid error")
        ),
      };
    }
  });

TaskEither<LoginError, void> launch(Uri uri) => TaskEither.tryCatch(
  () async => launchUrl(uri, mode: LaunchMode.externalApplication),
  (_, __) => LoginError(kind: LoginErrorKind.openUrl),
);

Task<bool> canLaunch(Uri uri) => Task(() async => canLaunchUrl(uri));