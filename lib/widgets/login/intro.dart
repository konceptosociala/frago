import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fpdart/fpdart.dart' show Either, None, Option, TaskEither;
import 'package:frago/models/verification_info.dart';
import 'package:frago/widgets/general/gaps.dart';
import 'package:frago/widgets/login/confirm.dart';
import 'package:frago/widgets/login/misc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simplegit/simplegit.dart';

class Intro extends StatelessWidget {
  final String clientId = 'Ov23liexZonCeMBDUUKX';
  final Option<void Function(LoggedUser user)> onLogin;

  const Intro({
    super.key, 
    this.onLogin = const None(),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IntroLogo(),
            LoginHeading(label: 'Your Frago Blog'),
            
            GapV(20),

            LoginButton(
              label: "Login to GitHub",
              onPressed: () => proceedLogin(context),
            ),
          ],
        ),
      ),
    );
  }

  void proceedLogin(BuildContext context) async {
    final result = await requestDeviceCode(clientId).run();

    result.match(
      (error) {
        if (!context.mounted) {
          return;
        }

        showError(Navigator.of(context), error);
      },
      (info) async {
        if (!context.mounted) {
          return;
        }

        final user = await Navigator.of(context).push<LoggedUser>(
          MaterialPageRoute(
            builder: (_) => ConfirmLogin(info: info),
          ),
        );

        if (user != null) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('frago_logged_user', user.toJson());
          
          onLogin.map((f) => f(user));
        }
      }
    );
  }
}

class IntroLogo extends StatelessWidget {
  const IntroLogo({super.key});

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
    "assets/svg/logo_white.svg",
    alignment: Alignment.center,
    width: 150,
  );
}

TaskEither<LoginError, VertificationInfo> requestDeviceCode(
  String clientId
) => TaskEither
  .tryCatch(
    () async => await http.post(
      Uri.parse('https://github.com/login/device/code'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: 'client_id=$clientId&scope=repo',
    ),
    (_, __) => LoginError(kind: LoginErrorKind.cannotResolve)
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
    (data) => 
      ['device_code', 'user_code', 'verification_uri']
        .every((key) => data.containsKey(key)), 
    (_) => LoginError(kind: LoginErrorKind.githubError)
  )
  .map((data) => VertificationInfo(
    deviceCode: data['device_code']!,
    userCode: data['user_code']!,
    verificationUri: data['verification_uri']!,
  ));