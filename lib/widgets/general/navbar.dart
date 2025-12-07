import 'package:flutter/material.dart';
import 'package:frago/core/theme_data.dart';
import 'package:frago/core/page_id.dart';

class NavBar extends StatelessWidget {
  final PageId currentPage;
  final Function(PageId) onPageSelected;
  final List<BottomNavigationBarItem> items;

  const NavBar({
    super.key,
    required this.currentPage,
    required this.onPageSelected,
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
            currentIndex: currentPage.toIndex(),
            onTap: (index) {
              if (items.length % 2 != 0 && index != (items.length / 2).floor()) {
                onPageSelected(PageId.fromIndex(index));
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
