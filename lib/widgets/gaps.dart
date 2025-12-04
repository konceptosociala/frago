import 'package:flutter/material.dart';

class GapH extends StatelessWidget {
  final double size;

  const GapH(this.size, {super.key});

  @override
  Widget build(BuildContext context) => SizedBox(width: size);
}

class GapV extends StatelessWidget {
  final double size;

  const GapV(this.size, {super.key});

  @override
  Widget build(BuildContext context) => SizedBox(height: size);
}
