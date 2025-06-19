import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frago/models/post.dart';
import 'package:frago/utils/utils.dart';
import 'package:frago/widgets/bg_body.dart';
import 'package:frago/widgets/post.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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

class PostSelectionMenu extends StatelessWidget {
  final VoidCallback? onExit;
  final VoidCallback? onDelete;
  final VoidCallback? onSelectAll;

  const PostSelectionMenu({
    super.key, 
    this.onDelete, 
    this.onSelectAll,
    this.onExit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 16),
        ElevatedButton.icon(
          label: Text(
            'Delete',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          icon: Icon(PhosphorIcons.trash(), color: Colors.white),
          onPressed: onDelete,
          style: ElevatedButton.styleFrom(
            backgroundColor: NothingColors.darkGrey,
            padding: EdgeInsets.all(16),
          ),
        ),
        SizedBox(width: 16),
        ElevatedButton.icon(
          icon: Icon(PhosphorIcons.selectionAll(), color: Colors.white),
          label: Text(
            'Select all',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          onPressed: onSelectAll,
          style: ElevatedButton.styleFrom(
            backgroundColor: NothingColors.darkGrey,
            padding: EdgeInsets.all(16),
          )
        ),
        Spacer(),
        ElevatedButton.icon(
          label: Text(''),
          icon: Icon(PhosphorIcons.x(), color: Colors.white),
          onPressed: onExit,
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            backgroundColor: NothingColors.darkGrey,
            padding: EdgeInsets.only(left: 8),
          ),
        ),
      ],
    );
  }
}

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

    posts = tempPosts;
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundBody(
      svgPath: 'assets/svg/bg.svg',
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AnimatedSwitcher(
              duration: Duration(milliseconds: 250),
              transitionBuilder:
                  (child, animation) =>
                      FadeTransition(opacity: animation, child: child),
              child:
                  postSelectionMode
                      ? Column(
                        key: ValueKey('selectionMenu'),
                        children: [
                          PostSelectionMenu(
                            onExit: () => log("EXIT"),
                            onDelete: () => log("DELETE"),
                            onSelectAll: () => log("SELECT ALL"),
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 16.0)),
                        ],
                      )
                      : SizedBox.shrink(key: ValueKey('emptyMenu')),
            ),
            Expanded(
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
                          postSelectionMode: postSelectionMode,
                        ),
                        if (i != posts.length - 1) SizedBox(height: 16),
                      ],
                      Padding(padding: EdgeInsets.only(bottom: 120.0)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
