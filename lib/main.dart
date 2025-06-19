import 'package:flutter/material.dart';
import 'package:frago/utils/theme_data.dart';
import 'package:frago/utils/utils.dart';
import 'package:frago/widgets/navbar.dart';
import 'package:frago/widgets/nothing_appbar.dart';
import 'package:frago/widgets/screens/post.dart';
import 'package:frago/widgets/screens/screens.dart';
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
  // UI
  ScreenId currentScreen = ScreenId.posts;
  Screens screens = Screens();

  @override
  void initState() {
    super.initState();

    screens.insert(ScreenId.posts, PostsScreen());
    screens.insert(ScreenId.workspace, Text('Workspace Screen'));
    screens.insert(ScreenId.media, Text('Media Screen'));
    screens.insert(ScreenId.profile, Text('Profile Screen'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NothingAppBar(
        label: 'Posts',
        icon: PhosphorIcons.sortAscending(),
        condition: currentScreen == ScreenId.posts,
        action: () {},
      ),
      extendBody: true,
      body: screens.get(currentScreen),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedFloatingActionButton(
        height: 72,
        width: 72,
        icon: PhosphorIcons.notePencil(),
        action: () {},
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
          BottomNavigationBarItem(icon: Icon(null), label: ''),
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
