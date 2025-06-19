import 'package:flutter/material.dart';
import 'package:frago/widgets/text.dart';

class NothingAppBar extends AppBar {
  final String label;
  final VoidCallback? action;
  final IconData? icon;
  final bool condition;

  NothingAppBar({
    super.key, 
    required this.label, 
    this.icon, 
    this.action,
    this.condition = true,
  })
    : super(
        toolbarHeight: 84,
        title: Padding(padding: EdgeInsets.all(12), child: NothingText(label)),
        actions: action != null && condition
          ? [
            Padding(
              padding: EdgeInsets.all(12),
              child: IconButton(
                onPressed: () {},
                icon: Padding(
                  padding: EdgeInsets.all(0),
                  child: Icon(icon, size: 44),
                ),
              ),
            ),
          ]
          : [],
      );
}
