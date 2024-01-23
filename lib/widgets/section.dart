import 'package:flutter/material.dart';

class XSection extends StatelessWidget {
  const XSection({
    super.key,
    required this.child,
    this.vertical,
    this.horizontal,
    this.left,
    this.top,
    this.right,
    this.bottom,
    this.all,
  });

  final Widget child;
  final double? horizontal;
  final double? vertical;
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;
  final double? all;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: all != null
          ? EdgeInsets.all(all!)
          : vertical == null && horizontal == null
              ? EdgeInsets.fromLTRB(
                  left ?? 0,
                  top ?? 0,
                  right ?? 0,
                  bottom ?? 0,
                )
              : EdgeInsets.symmetric(
                  vertical: vertical ?? 0,
                  horizontal: horizontal ?? 0,
                ),
      child: child,
    );
  }
}
