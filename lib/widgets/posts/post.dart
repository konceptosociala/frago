import 'package:flutter/material.dart';
import 'package:frago/core/colors.dart';
import 'package:frago/models/post.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class PostWidget extends StatelessWidget {
  final PostDescr post;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool postSelectionMode;

  const PostWidget({
    super.key,
    required this.post,
    required this.onTap,
    required this.onLongPress,
    required this.postSelectionMode,
  });

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      Material(
        color: post.selected 
          ? NothingColors.darkGrey 
          : NothingColors.almostBlack,
        borderRadius: BorderRadius.circular(15),
        elevation: 0,
        child: InkWell(
          onTap: onTap,
          onLongPress: onLongPress,
          borderRadius: BorderRadius.circular(15),
          splashColor: Theme.of(context).splashColor,
          child: Container(
            width: double.infinity,
            height: 175,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: NothingColors.darkGrey, width: 5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title,
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Padding(padding: EdgeInsets.only(top: 8.0)),
                Text(
                  post.summary,
                  style: TextStyle(fontSize: 18.0),
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.fade,
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ),
      ),
      if (postSelectionMode)
        Positioned(
          top: 8,
          right: 8,
          child: IgnorePointer(
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: NothingColors.almostBlack,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                post.selected
                  ? PhosphorIcons.checkCircle()
                  : Icons.radio_button_unchecked,
                color: post.selected ? NothingColors.paleGrey : Colors.grey,
                size: 32,
              ),
            ),
          ),
        ),
    ],
  );
}
