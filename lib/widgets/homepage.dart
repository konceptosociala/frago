import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:frago/models/app_model.dart';
import 'package:frago/models/post.dart';
import 'package:frago/widgets/general/navbar.dart';
import 'package:frago/widgets/general/nothing_appbar.dart';
import 'package:frago/core/page_id.dart';
import 'package:frago/widgets/general/sized_fab.dart';
import 'package:frago/widgets/login/misc.dart';
import 'package:frago/widgets/posts/create_post_dialog.dart';
import 'package:frago/widgets/posts/post_page.dart';
import 'package:frago/widgets/profile/profile_page.dart';
import 'package:frago/widgets/workspace/workspace_page.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomePage extends StatelessWidget {
  final AppModel model;
  final void Function(PageId) onPageChange;
  final VoidCallback onLogout;
  final void Function(int) onTogglePostSelection;
  final VoidCallback onPostCreated;
  final void Function(String) onCreatePostTitleChanged;
  final void Function(int) onEnterSelectionMode;
  final VoidCallback onExitSelectionMode;
  final VoidCallback onSelectAllPosts;
  final VoidCallback onDeleteSelectedPosts;
  final void Function(PostSorting) onChangeSorting;

  const HomePage({
    super.key,
    required this.model,
    required this.onPageChange,
    required this.onLogout,
    required this.onTogglePostSelection,
    required this.onEnterSelectionMode,
    required this.onExitSelectionMode,
    required this.onSelectAllPosts,
    required this.onDeleteSelectedPosts,
    required this.onChangeSorting,
    required this.onPostCreated,
    required this.onCreatePostTitleChanged,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: NothingAppBar(
      label: model.currentPage.toString(),
      icon: PhosphorIcons.sortAscending(),
      condition: model.currentPage == PageId.posts,
      action: () {
        // TODO: open Sorting dialog
      },
    ),
    extendBody: true,
    body: _getPage(),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    floatingActionButton: SizedFloatingActionButton(
      height: 72,
      width: 72,
      icon: PhosphorIcons.notePencil(),
      action: () => switch (model.currentWorkspace) {
        Some(:final value) when value.isInitialized() => showDialog(
          context: context, 
          builder: (BuildContext context) => CreatePostDialog(
            onTitleChanged: onCreatePostTitleChanged,
            onPostCreated: onPostCreated,
          ),
        ),
        _ => showError(Navigator.of(context), "Workspace is not initialized"),
      },
    ),
    bottomNavigationBar: NavBar(
      currentPage: model.currentPage,
      onPageSelected: onPageChange,
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

  Widget _getPage() {
    return switch (model.currentPage) {
      PageId.posts => PostsPage(
        posts: model.loadedPosts,
        currentWorkspace: model.currentWorkspace,
        postSelectionMode: model.postSelectionMode,
        onTogglePostSelection: onTogglePostSelection,
        onEnterSelectionMode: onEnterSelectionMode,
        onExitSelectionMode: onExitSelectionMode,
        onSelectAllPosts: onSelectAllPosts,
        onDeleteSelectedPosts: onDeleteSelectedPosts,
      ),
      PageId.workspace => WorkspacePage(),
      PageId.media => const Text('Media Page'),
      PageId.profile => ProfilePage(
        user: model.loggedUser.getOrElse(() => throw 'Unreachable'), 
        onLogout: onLogout,
      ),
    };
  }
}
