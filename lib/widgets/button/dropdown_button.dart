import 'package:fitness_app/src/themes/styles.dart';
import 'package:flutter/material.dart';

class XDropDownButton<T> extends StatelessWidget {
  const XDropDownButton({
    super.key,
    required this.value,
    this.onChanged,
    this.items,
    this.onPressedIcon,
    this.showIcon = false,
    this.selectedItems,
  });

  final T value;
  final void Function(T?)? onChanged;
  final List<DropdownMenuItem<T>>? items;
  final List<Widget> Function(BuildContext)? selectedItems;
  final void Function()? onPressedIcon;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      style: AppStyles.titleButtonSmall,
      icon: showIcon
          ? IconButton(
              onPressed: onPressedIcon,
              icon: const Icon(Icons.cancel),
            )
          : const SizedBox(),
      value: value,
      isExpanded: true,
      underline: const SizedBox(),
      items: items,
      selectedItemBuilder: selectedItems,
      onChanged: onChanged,
    );
  }
}
