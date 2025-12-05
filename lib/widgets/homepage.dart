import 'package:flutter/material.dart';
import 'package:frago/models/post.dart';
import 'package:frago/widgets/general/navbar.dart';
import 'package:frago/widgets/general/nothing_appbar.dart';
import 'package:frago/core/screen_id.dart';
import 'package:frago/widgets/general/sized_fab.dart';
import 'package:frago/widgets/posts/post_page.dart';
import 'package:frago/widgets/profile/profile_page.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:simplegit/simplegit.dart';

class HomePage extends StatelessWidget {
  final LoggedUser user;
  final ScreenId currentScreen;
  final List<PostDescr> posts;
  final bool postSelectionMode;
  final PostSorting postSorting;
  final void Function(ScreenId) onScreenChange;
  final VoidCallback onLogout;
  final void Function(int) onTogglePostSelection;
  final void Function(int) onEnterSelectionMode;
  final VoidCallback onExitSelectionMode;
  final VoidCallback onSelectAllPosts;
  final VoidCallback onDeleteSelectedPosts;
  final void Function(PostSorting) onChangeSorting;

  const HomePage({
    super.key,
    required this.user,
    required this.currentScreen,
    required this.posts,
    required this.postSelectionMode,
    required this.postSorting,
    required this.onScreenChange,
    required this.onLogout,
    required this.onTogglePostSelection,
    required this.onEnterSelectionMode,
    required this.onExitSelectionMode,
    required this.onSelectAllPosts,
    required this.onDeleteSelectedPosts,
    required this.onChangeSorting,
  });

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
      body: _getScreen(),
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
        onScreenSelected: onScreenChange,
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

  Widget _getScreen() {
    return switch (currentScreen) {
      ScreenId.posts => PostsScreen(
        posts: posts,
        postSelectionMode: postSelectionMode,
        onTogglePostSelection: onTogglePostSelection,
        onEnterSelectionMode: onEnterSelectionMode,
        onExitSelectionMode: onExitSelectionMode,
        onSelectAllPosts: onSelectAllPosts,
        onDeleteSelectedPosts: onDeleteSelectedPosts,
      ),
      ScreenId.workspace => const Text('Workspace Screen'),
      ScreenId.media => const Text('Media Screen'),
      ScreenId.profile => ProfileScreen(user: user, onLogout: onLogout),
    };
  }
}
