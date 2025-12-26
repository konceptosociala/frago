import 'package:flutter/material.dart';
import 'package:frago/models/post.dart';
import 'package:frago/widgets/general/gaps.dart';
import 'package:frago/widgets/posts/post.dart';

class PostsScrollview extends StatelessWidget {
  final List<PostDesc> posts;
  final bool postSelectionMode;
  final void Function(int)? onTap;
  final void Function(int)? onLongPress;

  const PostsScrollview({
    super.key,
    required this.posts,
    required this.postSelectionMode,
    this.onLongPress,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) => Expanded(
    child: ScrollConfiguration(
      behavior: ScrollConfiguration.of(
        context,
      ).copyWith(scrollbars: false, overscroll: false),
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < posts.length; i++) ...[
              PostWidget(
                post: posts[i],
                onTap: onTap != null ? () => onTap!(i) : null,
                onLongPress:
                    onLongPress != null ? () => onLongPress!(i) : null,
                postSelectionMode: postSelectionMode,
              ),

              if (i != posts.length - 1) GapV(16),
            ],
            Padding(padding: EdgeInsets.only(bottom: 120.0)),
          ],
        ),
      ),
    ),
  );
}
