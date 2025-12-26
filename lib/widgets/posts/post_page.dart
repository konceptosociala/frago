import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:frago/models/post.dart';
import 'package:frago/models/workspace.dart';
import 'package:frago/widgets/general/bg_body.dart';
import 'package:frago/widgets/general/gaps.dart';
import 'package:frago/widgets/posts/post_selection.dart';
import 'package:frago/widgets/posts/posts_scrollview.dart';

class PostsPage extends StatelessWidget {
  final List<PostDesc> posts;
  final Option<Workspace> currentWorkspace;
  final bool postSelectionMode;
  final void Function(int) onTogglePostSelection;
  final void Function(int) onEnterSelectionMode;
  final VoidCallback onExitSelectionMode;
  final VoidCallback onSelectAllPosts;
  final VoidCallback onDeleteSelectedPosts;

  const PostsPage({
    super.key,
    required this.posts,
    required this.currentWorkspace,
    required this.postSelectionMode,
    required this.onTogglePostSelection,
    required this.onEnterSelectionMode,
    required this.onExitSelectionMode,
    required this.onSelectAllPosts,
    required this.onDeleteSelectedPosts,
  });

  @override
  Widget build(BuildContext context) => PopScope(
    onPopInvokedWithResult: (didPop, result) {
      if (postSelectionMode) {
        onExitSelectionMode();
      }
    },
    canPop: !postSelectionMode,
    child: BackgroundBody(
      svgPath: 'assets/svg/bg.svg',
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27.0, vertical: 8.0),
        child: switch (currentWorkspace) {
          None() => 
            noWorkspace(Theme.of(context)),

          Some(value: Workspace(cloned: false)) => 
            shouldClone(Theme.of(context)),

          Some(value: Workspace(postsFolder: None())) =>
            noPostsFolder(Theme.of(context)),

          Some(value: Workspace(imagesFolder: None())) =>
            noImagesFolder(Theme.of(context)),

          _ => displayPosts(
            posts: posts, 
            postSelectionMode: postSelectionMode, 
            onTogglePostSelection: onTogglePostSelection, 
            onEnterSelectionMode: onEnterSelectionMode, 
            onExitSelectionMode: onExitSelectionMode, 
            onSelectAllPosts: onSelectAllPosts, 
            onDeleteSelectedPosts: onDeleteSelectedPosts,
          ),
        },
      ),
    ),
  );
}

Widget displayPosts({
  required posts,
  required postSelectionMode,
  required onTogglePostSelection,
  required onEnterSelectionMode,
  required onExitSelectionMode,
  required onSelectAllPosts,
  required onDeleteSelectedPosts,
}) => Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    PostSelectionMenu(
      isEnabled: postSelectionMode,
      onExit: onExitSelectionMode,
      onDelete: onDeleteSelectedPosts,
      onSelectAll: onSelectAllPosts,
    ),
    PostsScrollview(
      posts: posts,
      postSelectionMode: postSelectionMode,
      onTap: (index) {
        if (postSelectionMode) {
          onTogglePostSelection(index);
        }
      },
      onLongPress: (index) {
        onEnterSelectionMode(index);
      },
    )
  ],
);

Widget noImagesFolder(ThemeData theme) => Padding(
  padding: EdgeInsets.all(20.0),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(
        'No images folder set!',
        textAlign: TextAlign.center,
        style: theme.textTheme.headlineLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      const GapV(16.0),
      Text(
        'Open `Workspace` tab and set path for your images.',
        textAlign: TextAlign.center,
        style: theme.textTheme.bodyLarge,
      ),
    ],
  ),
);

Widget noPostsFolder(ThemeData theme) => Padding(
  padding: EdgeInsets.all(20.0),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(
        'No posts folder set!',
        textAlign: TextAlign.center,
        style: theme.textTheme.headlineLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      const GapV(16.0),
      Text(
        'Open `Workspace` tab and set path for your posts.',
        textAlign: TextAlign.center,
        style: theme.textTheme.bodyLarge,
      ),
    ],
  ),
);

Widget shouldClone(ThemeData theme) => Padding(
  padding: EdgeInsets.all(20.0),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(
        'Workspace repository isn\'t cloned!',
        textAlign: TextAlign.center,
        style: theme.textTheme.headlineLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      const GapV(16.0),
      Text(
        'Open `Workspace` tab and clone your repo from remote.',
        textAlign: TextAlign.center,
        style: theme.textTheme.bodyLarge,
      ),
    ],
  ),
);

Widget noWorkspace(ThemeData theme) => Padding(
  padding: EdgeInsets.all(20.0),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(
        'This account has no GitHub Pages workspace!',
        textAlign: TextAlign.center,
        style: theme.textTheme.headlineLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      const GapV(16.0),
      Text(
        'Create a new repository on GitHub named '
        '`<username>.github.io` and reload Frago.',
        textAlign: TextAlign.center,
        style: theme.textTheme.bodyLarge,
      ),
    ],
  ),
);