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
          data: darkTheme(interactive: false),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentScreen.toIndex(),
            onTap: (index) {
              if (items.length % 2 != 0 && index != (items.length / 2).floor()) {
                onScreenSelected(ScreenId.fromIndex(index));
              }
            },
            items: items,
          ),
        ),
      ),
    );
  }
}

class EmptyNavigationBarItem extends BottomNavigationBarItem {
  EmptyNavigationBarItem() : super(icon: Icon(null), label: '');
}
