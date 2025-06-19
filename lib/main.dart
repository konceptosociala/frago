import 'package:flutter/material.dart';
import 'package:frago/utils/theme_data.dart';
import 'package:frago/utils/utils.dart';
import 'package:frago/widgets/homepage.dart';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Utils.isDesktop()) {
    setWindowTitle('Frago Debug');
    setWindowMinSize(Utils.debugPhoneSize);
    setWindowMaxSize(Utils.debugPhoneSize);
  }

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Frago',
      theme: FragoThemeData.dark(),
      home: const HomePage(),
    );
  }
}