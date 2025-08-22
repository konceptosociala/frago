import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frago/utils/utils.dart';
import 'package:frago/widgets/login/misc.dart';
import 'package:http/http.dart' as http;
import 'package:option_result/option_result.dart';
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

  void confirmLogin(BuildContext context) async {
    final openResult = await _openVerificationPage(verificationUri);

    if (!context.mounted) return;

    if (openResult case Err(value: final error)) {
      showError(context, error);
      Navigator.of(context).pop();
      return;
    }

    final tokenResult = await _pollForToken(
      clientId: 'Ov23liexZonCeMBDUUKX',
      deviceCode: deviceCode,
    );

    if (!context.mounted) return;

    if (tokenResult case Err(value: final error)) {
      showError(context, error);
      Navigator.of(context).pop();
      return;
    }

    final token = tokenResult.unwrap();
    final userResult = await _fetchGitHubUser(token);

    if (!context.mounted) return;

    if (userResult case Err(value: final error)) {
      showError(context, error);
      Navigator.of(context).pop();
      return;
    }

    final login = userResult.unwrap();
    final user = LoggedUser(
      name: login,
      token: token,
    );

    Navigator.of(context).pop(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please confirm your\nlogin on GitHub:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, color: NothingColors.paleGrey),
            ),
            LoginHeading(label: userCode),
            SizedBox(height: 20),
            LoginButton(
              label: 'Confirm',
              onPressed: () => confirmLogin(context),
            ),
            SizedBox(height: 20),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<OpenVerificationResult> _openVerificationPage(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
      return Ok(());
    } else {
      return Err(LoginError(kind: LoginErrorKind.openUrl));
    }
  }

  Future<GithubUserResult> _fetchGitHubUser(String token) async {
    final response = await http.get(
      Uri.parse('https://api.github.com/user'),
      headers: {
        'Authorization': 'token $token',
        'Accept': 'application/vnd.github.v3+json',
      },
    );

    if (response.statusCode == 200) {
      final data = Uri.splitQueryString(response.body);
      if (data.containsKey('login')) {
        return Ok(data['login']!);
      } else {
        return Err(LoginError(kind: LoginErrorKind.fetchGithubUser));
      }
    } else {
      return Err(LoginError(kind: LoginErrorKind.fetchGithubUser));
    }
  }

  Future<PollTokenResult> _pollForToken({
    required String clientId,
    required String deviceCode,
  }) async {
    var minimumInterval = 5;
    while (true) {
      await Future.delayed(Duration(seconds: minimumInterval));

      final response = await http.post(
        Uri.parse('https://github.com/login/oauth/access_token'),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body:
            'client_id=$clientId&device_code=$deviceCode&grant_type=urn:ietf:params:oauth:grant-type:device_code',
      );

      final data = Uri.splitQueryString(response.body);

      if (data.containsKey('access_token')) {
        return Ok(data['access_token']!);
      } else {
        switch (data['error']) {
          case 'authorization_pending':
            log('Authorization pending, retrying...');
            break;

          case 'slow_down':
            log('Slow down the polling...');
            minimumInterval = int.parse(data['interval']!);
            break;

          case 'expired_token':
            return Err(LoginError(kind: LoginErrorKind.expiredToken));

          default:
            return Err(
              LoginError(
                kind: LoginErrorKind.githubError,
                message: data['error'],
              ),
            );
        }
      }
    }
  }
}
