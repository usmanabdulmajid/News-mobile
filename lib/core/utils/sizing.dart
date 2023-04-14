import 'package:flutter/material.dart';

class YMargin extends StatelessWidget {
  const YMargin(this.y, {Key? key}) : super(key: key);
  final double y;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: y);
  }
}

class XMargin extends StatelessWidget {
  const XMargin(this.x, {Key? key}) : super(key: key);
  final double x;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: x);
  }
}
