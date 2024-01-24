import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:fitness_app/widgets/button/text_button.dart';
import 'package:fitness_app/widgets/title/heading.dart';
import 'package:flutter/material.dart';

class XBlock extends StatelessWidget {
  const XBlock(
      {super.key, required this.child, this.onPressed, required this.header});

  final Widget child;
  final void Function()? onPressed;
  final String header;

  @override
  Widget build(BuildContext context) {
    return XHeading(
      header: header,
      action: XTextButton(
        title: S.of(context).see_all,
        style: AppStyles.primaryColorText,
        onPressed: onPressed,
      ),
      child: SizedBox(
        height: 230,
        child: child,
      ),
    );
  }
}
