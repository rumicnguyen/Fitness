import 'package:fitness_app/src/themes/styles.dart';
import 'package:flutter/material.dart';

class XDropDownButton<T> extends StatelessWidget {
  const XDropDownButton(
      {super.key,
      this.isExpand = false,
      required this.value,
      required this.data,
      this.onChanged,
      required this.getTitle,
      this.underline,
      this.child});

  final bool isExpand;
  final T value;
  final List<T> data;
  final void Function(T?)? onChanged;
  final String Function(T) getTitle;
  final Widget? underline;
  final List<Widget>? child;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      icon: const Icon(Icons.expand_more),
      value: value,
      isExpanded: isExpand,
      underline: underline ?? Container(),
      items: data.map((e) {
        return DropdownMenuItem(
          value: e,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: child ??
                [
                  Text(
                    getTitle(e),
                    style: AppStyles.titleButtonSmall,
                  ),
                ],
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
