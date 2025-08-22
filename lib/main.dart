import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frago/utils/theme_data.dart';
import 'package:frago/utils/utils.dart';
import 'package:frago/widgets/homepage.dart';
import 'package:frago/widgets/login/misc.dart';
import 'package:http/http.dart' as http;
import 'package:option_result/option_result.dart';
import 'package:simplegit/simplegit.dart';
import 'package:window_size/window_size.dart';

void main() {
  Git.init();
  WidgetsFlutterBinding.ensureInitialized();

  if (Utils.isDesktop()) {
    setWindowTitle('Frago Debug');
    setWindowMinSize(Utils.debugPhoneSize);
    setWindowMaxSize(Utils.debugPhoneSize);
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
      theme: FragoThemeData.dark(),
      home: loggedUser != null
        ? HomePage(loggedUser!)
        : LoginPage(
          onLogin: (user) {
            setState(() {
              loggedUser = user;
            });
          },
        ),
    );
  }

  void _checkLoginStatus() async {
    final storage = FlutterSecureStorage();
    final userJson = await storage.read(key: 'frago_logged_user');
    if (userJson != null) {
      final user = LoggedUser.fromJson(userJson);

      switch (await _isTokenValid(user.token)) {
        case Ok():
          setState(() {
            loggedUser = user;
          });
          break;
        case Err(value: final error):
          showError(context, error);
          break;
      }
    }
  }

  Future<Result<(), LoginError>> _isTokenValid(String token) async {
    final response = await http.get(
      Uri.parse('https://api.github.com/user'),
      headers: {
        'Authorization': 'token $token',
        'Accept': 'application/vnd.github.v3+json',
      },
    );

    if (response.statusCode == 200) {
      return Ok(());
    } else if (response.statusCode == 401) {
      return Err(LoginError(kind: LoginErrorKind.expiredToken));
    } else {
      return Err(
        LoginError(
          kind: LoginErrorKind.githubError,
          message: 'Status code: ${response.statusCode}',
        ),
      );
    }
  }
}
