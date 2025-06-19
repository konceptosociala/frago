import 'package:flutter/material.dart';
import 'package:frago/utils/theme_data.dart';
import 'package:frago/widgets/screens/screens.dart';

class NavBar extends StatelessWidget {
  final ScreenId currentScreen;
  final Function(ScreenId) onScreenSelected;
  final List<BottomNavigationBarItem> items;

  const NavBar({
    super.key,
    required this.currentScreen,
    required this.onScreenSelected,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
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
            currentIndex: currentScreen.toIndex(),
            onTap: (index) {
              onScreenSelected(ScreenId.fromIndex(index));
            },
            items: items,
          ),
        ),
      ),
    );
  }
}
