import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frago/widgets/login/confirm.dart';
import 'package:frago/widgets/login/misc.dart';
import 'package:http/http.dart' as http;
import 'package:option_result/option_result.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simplegit/simplegit.dart';

class Intro extends StatefulWidget {
  final String _clientId = 'Ov23liexZonCeMBDUUKX';

  final void Function(LoggedUser user)? onLogin;

  const Intro({super.key, this.onLogin});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    final nav = Navigator.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/svg/logo_white.svg",
              alignment: Alignment.center,
              width: 150,
            ),
            LoginHeading(label: 'Your Frago Blog'),
            SizedBox(height: 20),
            LoginButton(
              label: "Login to GitHub",
              onPressed: () => _startLogin(nav),
            ),
          ],
        ),
      ),
    );
  }

  void _startLogin(NavigatorState nav) async {
    final result = await _requestDeviceCode(widget._clientId);

    switch (result) {
      case Ok(value: final data):
        final deviceCode = data['device_code'];
        final userCode = data['user_code'];
        final verificationUri = data['verification_uri'];

        final user = await nav.push<LoggedUser>(
          MaterialPageRoute(
            builder: (_) => ConfirmLogin(
              deviceCode: deviceCode,
              userCode: userCode,
              verificationUri: verificationUri,
            ),
          ),
        );

        if (user != null) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('frago_logged_user', user.toJson());
          if (widget.onLogin != null) {
            widget.onLogin!(user);
          }
        }

        break;

      case Err(value: final error):
        showError(nav, error);
        break;
    }
  }

  Future<RequestDeviceResult> _requestDeviceCode(String clientId) async {
    try {
      final response = await http.post(
        Uri.parse('https://github.com/login/device/code'),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: 'client_id=$clientId&scope=repo',
      );

      if (response.statusCode == 200) {
        return Ok(Uri.splitQueryString(response.body));
      } else {
        return Err(LoginError(kind: LoginErrorKind.requestDevice));
      }
    } catch (_) {
      return Err(LoginError(kind: LoginErrorKind.cannotResolve));
    }
  }
}
