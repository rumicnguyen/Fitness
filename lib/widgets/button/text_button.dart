import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:flutter/material.dart';

class XTextButton extends StatelessWidget {
  const XTextButton(
      {super.key, this.icon, required this.title, this.onPressed, this.ending});

  final Widget? icon;
  final Widget? ending;
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: (icon != null)
          ? TextButton.icon(
              icon: icon ??
                  const Icon(
                    Icons.account_circle_rounded,
                    color: AppColors.blue_500,
                  ),
              onPressed: onPressed,
              label: Text(
                title,
                style: AppStyles.titleButtonSmall,
              ),
            )
          : (ending != null)
              ? TextButton(
                  onPressed: onPressed,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: AppStyles.titleButtonSmall,
                      ),
                      ending ?? const Icon(Icons.arrow_right_alt)
                    ],
                  ),
                )
              : TextButton(
                  onPressed: onPressed,
                  child: Text(
                    title,
                    style: AppStyles.titleButtonSmall,
                  ),
                ),
    );
  }
}
