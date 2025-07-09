import 'package:flutter/material.dart';
import 'package:frago/models/post.dart';
import 'package:frago/widgets/post.dart';

class PostsScrollview extends StatelessWidget {
  final List<Post> posts;
  final bool postSelectionMode;
  final Function(Post)? onTap;
  final Function(Post)? onLongPress;

  const PostsScrollview({
    super.key,
    required this.posts,
    required this.postSelectionMode,
    this.onLongPress,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context)
          .copyWith(scrollbars: false, overscroll: false),
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (int i = 0; i < posts.length; i++) ...[
                PostWidget(
                  post: posts[i],
                  onTap: onTap,
                  onLongPress: onLongPress,
                  postSelectionMode: postSelectionMode,
                ),
                if (i != posts.length - 1) SizedBox(height: 16),
              ],
              Padding(padding: EdgeInsets.only(bottom: 120.0)),
            ],
          ),
        ),
      ),
    );
  }
}