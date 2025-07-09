import 'package:flutter/material.dart';
import 'package:frago/models/post.dart';
import 'package:frago/widgets/bg_body.dart';
import 'package:frago/widgets/post_selection.dart';
import 'package:frago/widgets/posts_scrollview.dart';

final tempPosts = [
  Post(
    'Linia algebro por Despero (parto 2)',
    'La punkto en la supro de la unuopa vektoro, komencanta de la origino, kiu havas angulon φ al la X-akso, estas:',
  ),
  Post(
    'Anguloj inter vektoroj',
    'La punkto en la supro de la unuopa vektoro, komencanta de la origino, kiu havas angulon φ al la X-akso, estas:',
  ),
  Post(
    'Anguloj inter vektoroj',
    'La punkto en la supro de la unuopa vektoro, komencanta de la origino, kiu havas angulon φ al la X-akso, estas:',
  ),
  Post(
    'Anguloj inter vektoroj',
    'La punkto en la supro de la unuopa vektoro, komencanta de la origino, kiu havas angulon φ al la X-akso, estas:',
  ),
];

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostsScreen> {
  // Data
  List<Post> posts = List.empty();

  // Config
  PostSorting sorting = PostSorting.dateDescending;
  bool postSelectionMode = false;

  @override
  void initState() {
    super.initState();

    // TODO: retrieve posts
    posts = tempPosts;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (postSelectionMode) {
          _exitSelectionMenu();
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
                onExit: _exitSelectionMenu,
                onDelete: _deleteSelected,
                onSelectAll: _selectAll,
              ),
              PostsScrollview(
                posts: posts,
                postSelectionMode: postSelectionMode,
                onTap: (post) {
                  if (postSelectionMode) {
                    setState(() {
                      post.selected = !post.selected;
                    });
                  }
                },
                onLongPress: (post) {
                  setState(() {
                    postSelectionMode = true;
                    post.selected = !post.selected;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _exitSelectionMenu() {
    setState(() {
      postSelectionMode = false;

      for (var post in posts) {
        post.selected = false;
      }
    });
  }

  void _selectAll() {
    setState(() {
      if (posts.any((p) => !p.selected)) {
        for (var post in posts) {
          post.selected = true;
        }
      } else {
        for (var post in posts) {
          post.selected = false;
        }
      }
    });
  }

  void _deleteSelected() {}
}
