import 'package:flutter/material.dart';
import 'package:frago/utils/theme_data.dart';
import 'package:frago/utils/utils.dart';
import 'package:frago/widgets/homepage.dart';
import 'package:option_result/option_result.dart';
import 'package:simplegit/simplegit.dart';
import 'package:window_size/window_size.dart';

void main() {
  Git.init();
  WidgetsFlutterBinding.ensureInitialized();

  switch (LocalRepository.open("/home/nutov2/doc/ks/proj/frago")) {
    case Err error:
      print('Failed to open repository: ${error.value}');
      break;
    default:
      break;
  }

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
