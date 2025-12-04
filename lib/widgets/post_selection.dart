import 'package:flutter/material.dart';
import 'package:frago/utils/utils.dart';
import 'package:frago/widgets/gaps.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class PostSelectionMenu extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback? onExit;
  final VoidCallback? onDelete;
  final VoidCallback? onSelectAll;

  const PostSelectionMenu({
    super.key,
    required this.isEnabled,
    this.onDelete,
    this.onSelectAll,
    this.onExit,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 250),
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation, 
        child: child,
      ),
      child: isEnabled
        ? Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GapH(16),
                
                ElevatedButton.icon(
                  label: Text(
                    'Delete',
                    style: TextStyle(
                      color: NothingColors.paleGrey, 
                      fontSize: 16,
                    ),
                  ),
                  icon: Icon(
                    PhosphorIcons.trash(), 
                    color: NothingColors.paleGrey,
                  ),
                  onPressed: onDelete,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: NothingColors.scarlet,
                    padding: EdgeInsets.all(16),
                  ),
                ),
                
                GapH(16),

                ElevatedButton.icon(
                  icon: Icon(
                    PhosphorIcons.selectionAll(),
                    color: NothingColors.paleGrey,
                  ),
                  label: Text(
                    'Select all',
                    style: TextStyle(
                      color: NothingColors.paleGrey, 
                      fontSize: 16,
                    ),
                  ),
                  onPressed: onSelectAll,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: NothingColors.darkGrey,
                    padding: EdgeInsets.all(16),
                  ),
                ),
                Spacer(),
                ElevatedButton.icon(
                  label: Text(''),
                  icon: Icon(
                    PhosphorIcons.x(), 
                    color: NothingColors.paleGrey,
                  ),
                  onPressed: onExit,
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: NothingColors.darkGrey,
                    padding: EdgeInsets.only(left: 8),
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 16.0)),
          ])
        : SizedBox.shrink(),
    );
  }
}