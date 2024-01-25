import 'package:fitness_app/src/themes/styles.dart';
import 'package:fitness_app/widgets/dropdown/dropdown_button.dart';
import 'package:fitness_app/widgets/dropdown/dropdown_item.dart';
import 'package:flutter/material.dart';

class FilterDropdown<T> extends StatelessWidget {
  const FilterDropdown({
    super.key,
    this.getValue,
    this.onChanged,
    this.onPressedIcon,
    required this.header,
    required this.list,
    required this.value,
    required this.valueOnFilter,
  });
  final String Function(T)? getValue;
  final String header;
  final List<T> list;
  final T value;
  final T valueOnFilter;
  final void Function(String?)? onChanged;
  final void Function()? onPressedIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: AppStyles.heading,
        ),
        XDropDownButton(
          showIcon: value != valueOnFilter,
          onPressedIcon: onPressedIcon,
          value: getValue != null ? getValue!(valueOnFilter) : '',
          items: _buildList(value: value),
          selectedItems: (context) {
            return _buildList(
              check: true,
              value: value,
            );
          },
          onChanged: onChanged,
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> _buildList({
    required T value,
    bool check = false,
  }) {
    return DropDownItem.buildItem(
      check: check,
      currentItem: value,
      list: list,
      getValue: getValue,
    );
  }
}
