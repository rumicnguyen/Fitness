import 'package:flutter/material.dart';

class XButton extends StatelessWidget {
  const XButton({
    this.onPressed,
    this.title,
    this.child,
    this.icon,
    this.busy = false,
    this.enabled = true,
    this.backgroundColor,
    this.borderRadius,
    required this.width,
    required this.height,
    super.key,
    this.titleStyle,
  });

  final bool busy;
  final bool enabled;
  final double width;
  final double height;
  final double? borderRadius;
  final Color? backgroundColor;
  final Widget? icon;
  final String? title;
  final Widget? child;
  final TextStyle? titleStyle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final onPressed = enabled
        ? () {
            if (this.onPressed != null || busy == false) {
              this.onPressed?.call();
            }
          }
        : null;
    return SizedBox(
      width: width,
      height: height,
      child: icon != null
          ? ElevatedButton.icon(
              onPressed: onPressed,
              style: _buildStyle(),
              label: child ??
                  Text(
                    title ?? '',
                    style: titleStyle,
                  ),
              icon: icon!,
            )
          : ElevatedButton(
              onPressed: onPressed,
              style: _buildStyle(),
              child: Center(
                child: busy
                    ? null
                    : (child ??
                        Text(
                          title ?? '',
                          style: titleStyle,
                        )),
              ),
            ),
    );
  }

  ButtonStyle _buildStyle() {
    return ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
      ),
      backgroundColor: backgroundColor,
    );
  }
}
