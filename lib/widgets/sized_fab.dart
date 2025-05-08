import 'package:flutter/material.dart';

class SizedFloatingActionButton extends StatelessWidget {
  final double height;
  final double width;
  final IconData icon;
  final VoidCallback action;

  const SizedFloatingActionButton({
    super.key,
    required this.height,
    required this.width,
    required this.icon,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: action,
          shape: const CircleBorder(),
          child: Icon(icon),
        ),
      ),
    );
  } 
}