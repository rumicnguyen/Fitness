import 'package:flutter/material.dart';

class XOutlinedButton extends StatelessWidget {
  const XOutlinedButton(
      {super.key,
      required this.child,
      this.width,
      this.height,
      this.onPressed});

  final Widget child;
  final double? width;
  final double? height;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: const ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}
