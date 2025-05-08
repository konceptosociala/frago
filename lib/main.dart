import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frago/utils/theme_data.dart';
import 'package:frago/utils/utils.dart';
import 'package:frago/widgets/bg_body.dart';
import 'package:frago/widgets/nothing_appbar.dart';
import 'package:frago/widgets/sized_fab.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Utils.isDesktop()) {
    setWindowTitle('Frago');
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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NothingAppBar(
        label: 'Posts',
        icon: PhosphorIcons.sortAscending(),
        action: () {},
      ),
      extendBody: true,
      body: BackgroundBody(
        svgPath: 'assets/svg/bg.svg', 
        child: Column(
          children: [
            
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedFloatingActionButton(
        height: 72, 
        width: 72, 
        icon: PhosphorIcons.notePencil(),
        action: () {},
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 12.0,
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.all(0),
        child: SizedBox(
          height: kBottomNavigationBarHeight,
          child: Theme(
            data: FragoThemeData.dark(interactive: false),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedPage,
              onTap: (index) {
                setState(() {
                  if (index != 2) {
                    _selectedPage = index;
                    log("$index");
                  }
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(PhosphorIcons.notebook()),
                  label: 'Posts',
                ),
                BottomNavigationBarItem(
                  icon: Icon(PhosphorIcons.desk()),
                  label: 'Workspace',
                ),
                BottomNavigationBarItem(icon: Icon(null), label: ''),
                BottomNavigationBarItem(
                  icon: Icon(PhosphorIcons.images()),
                  label: 'Media',
                ),
                BottomNavigationBarItem(
                  icon: Icon(PhosphorIcons.user()),
                  label: 'Profile',
                ),
              ]
            )  
          ),
        ),
      ),
    );
  }
}
