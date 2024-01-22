import 'package:fitness_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class XAvatar extends StatelessWidget {
  const XAvatar({
    super.key,
    this.avatar,
    this.size,
  });

  final String? avatar;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        avatar ?? Assets.images.user.path,
        width: size ?? 55,
        height: size ?? 55,
        fit: BoxFit.cover,
      ),
    );
  }
}
