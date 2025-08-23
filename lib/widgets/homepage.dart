import 'package:flutter/material.dart';
import 'package:frago/widgets/navbar.dart';
import 'package:frago/widgets/nothing_appbar.dart';
import 'package:frago/widgets/screens/screens.dart';
import 'package:frago/widgets/sized_fab.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:simplegit/simplegit.dart';

class HomePage extends StatefulWidget {
  final LoggedUser user;
  final VoidCallback onLogout;

  const HomePage({
    super.key,
    required this.user,
    required this.onLogout,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScreenId currentScreen = ScreenId.posts;
  late Screens screens;

  @override
  void initState() {
    super.initState();
    screens = Screens(widget.user, widget.onLogout);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NothingAppBar(
        label: currentScreen.toString(),
        icon: PhosphorIcons.sortAscending(),
        condition: currentScreen == ScreenId.posts,
        action: () {
          // TODO: open Sorting dialog
        },
      ),
      extendBody: true,
      body: screens.get(currentScreen),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedFloatingActionButton(
        height: 72,
        width: 72,
        icon: PhosphorIcons.notePencil(),
        action: () {
          // TODO: add new post
        },
      ),
      bottomNavigationBar: NavBar(
        currentScreen: currentScreen,
        onScreenSelected: (screen) {
          setState(() {
            currentScreen = screen;
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
          EmptyNavigationBarItem(),
          BottomNavigationBarItem(
            icon: Icon(PhosphorIcons.images()),
            label: 'Media',
          ),
          BottomNavigationBarItem(
            icon: Icon(PhosphorIcons.user()),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
