import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart' show Left, Right, Some, TaskEither;
import 'package:frago/utils/theme_data.dart';
import 'package:frago/utils/utils.dart';
import 'package:frago/widgets/gaps.dart';
import 'package:frago/widgets/homepage.dart';
import 'package:frago/widgets/login/misc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simplegit/simplegit.dart';
import 'package:window_size/window_size.dart';

void main() {
  Git.init();
  WidgetsFlutterBinding.ensureInitialized();

  if (isDesktop()) {
    setWindowTitle('Frago Debug');
    setWindowMinSize(debugPhoneSize);
    setWindowMaxSize(debugPhoneSize);
  }

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  LoggedUser? loggedUser;
  bool checkedLogin = false;
  bool logged = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Frago',
      theme: darkTheme(),
      home: Builder(
        builder: (context) {
          if (!checkedLogin) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (!logged) {
            return LoginPage(
              onLogin: Some((user) {
                setState(() {
                  loggedUser = user;
                  logged = true;
                });
              },
            ));
          }

          return HomePage(
            user: loggedUser!,
            onLogout: () async {
              setState(() {
                loggedUser = null;
                logged = false;
              });

              final prefs = await SharedPreferences.getInstance();
              await prefs.remove('frago_logged_user');
            },
          );
        },
      ),
    );
  }

  void _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('frago_logged_user');

    if (userJson == null) {
      setState(() {
        logged = false;
        checkedLogin = true;
      });
      return;
    }

    final user = LoggedUser.fromJson(userJson);

    final result = await verifyToken(user.token).run();
    switch (result) {
      case Right():
        setState(() {
          loggedUser = user;
          logged = true;
          checkedLogin = true;
        });
        break;

      case Left(value: final error):
        if (error.kind == LoginErrorKind.cannotResolve) {
          setState(() {
            loggedUser = user;
            logged = true;
            checkedLogin = true;
          });
        } else {
          final prefs = await SharedPreferences.getInstance();
          await prefs.remove('frago_logged_user');

          setState(() {
            logged = false;
            checkedLogin = true;
          });
        }
        break;
    }
  }

  TaskEither<LoginError, void> verifyToken(String token) => TaskEither.Do(
    ($) async {
      final response = await $(TaskEither.tryCatch(
        () async => await http.get(
          Uri.parse('https://api.github.com/user'),
          headers: {
            'Authorization': 'token $token',
            'Accept': 'application/vnd.github.v3+json',
          },
        ),
        (_, __) => LoginError(kind: LoginErrorKind.cannotResolve),
      ));

      return switch (response.statusCode) {
        200 => ok(),

        401 => $(TaskEither.left(
          LoginError(kind: LoginErrorKind.expiredToken)
        )),

        _ => $(TaskEither.left(
          LoginError(
            kind: LoginErrorKind.githubError,
            message: 'Status code: ${response.statusCode}',
          ),
        )),
      };
    }
  );
}

class NoInternetPage extends StatelessWidget {
  final VoidCallback onRetry;

  const NoInternetPage(this.onRetry, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LoginHeading(label: 'No internet connection'),
            
            GapV(16),

            LoginButton(onPressed: onRetry, label: 'Retry'),
          ],
        ),
      ),
    );
  }
}
