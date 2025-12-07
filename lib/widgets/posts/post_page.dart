import 'package:flutter/material.dart';
import 'package:frago/models/post.dart';
import 'package:frago/widgets/general/bg_body.dart';
import 'package:frago/widgets/posts/post_selection.dart';
import 'package:frago/widgets/posts/posts_scrollview.dart';

class PostsPage extends StatelessWidget {
  final List<PostDescr> posts;
  final bool postSelectionMode;
  final void Function(int) onTogglePostSelection;
  final void Function(int) onEnterSelectionMode;
  final VoidCallback onExitSelectionMode;
  final VoidCallback onSelectAllPosts;
  final VoidCallback onDeleteSelectedPosts;

  const PostsPage({
    super.key,
    required this.posts,
    required this.postSelectionMode,
    required this.onTogglePostSelection,
    required this.onEnterSelectionMode,
    required this.onExitSelectionMode,
    required this.onSelectAllPosts,
    required this.onDeleteSelectedPosts,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
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
          child: Column(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}