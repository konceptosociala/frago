import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BackgroundBody extends StatelessWidget {
  final Widget child;
  final String svgPath;

  const BackgroundBody({
    super.key, 
    required this.svgPath,
    required this.child, 
  });

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      SizedBox.expand(
        child: Padding(
          padding: EdgeInsets.fromLTRB(72, 72, 72, 144),
          child: SvgPicture.asset(
            svgPath,
            fit: BoxFit.contain,
            alignment: Alignment.center,
          ),
        ),
      ),
      child,
    ],
  );
}