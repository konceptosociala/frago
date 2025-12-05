import 'package:flutter/widgets.dart';

class NothingText extends Text {
  NothingText(
    super.data, {
    super.key,
    super.textAlign,
    super.overflow,
    super.maxLines,
    TextStyle? style,
  }) : super(
    style: TextStyle(
      fontFamily: 'Ndot',
      fontSize: 32,
    ).merge(style),
  );
}