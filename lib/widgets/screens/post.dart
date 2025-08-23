import 'package:flutter/material.dart';
import 'package:frago/models/post.dart';
import 'package:frago/widgets/bg_body.dart';
import 'package:frago/widgets/post_selection.dart';
import 'package:frago/widgets/posts_scrollview.dart';

final tempPosts = [
  Post(
    'Making a Static Blog in Elm: Why and How?',
    'Warning: this post is more like a cheat sheet than a full tutorial, so you should acquaint yourself with some basics of functional programming, or at least read the official Elm guide first.',
  ),
  Post(
    'Loading 3D texture in Bevy',
    'To load an image into our app Bevy provides us with a custom Image type. However, AssetServer in Bevy (as of version 0.15) only supports 2D image loading for now, so we need to perhaps implement a custom 3D image asset loader. For our tutorial we will use png and jpeg raster image types, but you can also try to implement importing of raw MagicaVoxel data, e.g. using dot_vox crate.',
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
    for (var post in posts) {
      post.selected = false;
    }
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
