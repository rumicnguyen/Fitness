import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:fitness_app/widgets/button/text_button.dart';
import 'package:fitness_app/widgets/card_item/card_item.dart';
import 'package:fitness_app/widgets/title/heading.dart';
import 'package:flutter/material.dart';

class XBlock extends StatelessWidget {
  const XBlock({
    super.key,
    required this.child,
    this.onPressed,
    required this.header,
    this.type,
    this.enableActions = true,
    this.height,
  });

  final Widget child;
  final bool enableActions;
  final void Function()? onPressed;
  final String header;
  final LayoutType? type;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return XHeading(
      header: header,
      action: enableActions
          ? (type == LayoutType.grid
              ? const SizedBox()
              : XTextButton(
                  title: S.of(context).see_all,
                  style: AppStyles.primaryColorText,
                  onPressed: onPressed,
                ))
          : null,
      child: type == null || type == LayoutType.card
          ? SizedBox(
              height: height ?? 230,
              child: child,
            )
          : child,
    );
  }
}
