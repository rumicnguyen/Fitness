import 'package:fitness_app/src/themes/styles.dart';
import 'package:flutter/material.dart';

class DropDownItem<T> extends StatelessWidget {
  const DropDownItem({
    super.key,
    required this.currentItem,
    required this.list,
    this.getValue,
  });

  final bool check = false;
  final T currentItem;
  final List<T> list;
  final String Function(T)? getValue;

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  static List<DropdownMenuItem<String>> buildItem<T>({
    bool check = false,
    required T currentItem,
    required List<T> list,
    String Function(T)? getValue,
  }) {
    return list.map((e) {
      return DropdownMenuItem(
        value: getValue!(e),
        child: Text(
          getValue(e),
          style: check
              ? (e == currentItem
                  ? AppStyles.grayTextLarge
                  : AppStyles.filterText)
              : AppStyles.blackTextLarge,
        ),
      );
    }).toList();
  }
}
