import 'package:fitness_app/src/network/data/enum/locale_enum.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:fitness_app/widgets/button/outlined_button.dart';
import 'package:flutter/material.dart';

class LocaleDropDownButton extends StatefulWidget {
  const LocaleDropDownButton({super.key});

  @override
  State<LocaleDropDownButton> createState() => _LocaleDropDownButtonState();
}

class _LocaleDropDownButtonState extends State<LocaleDropDownButton> {
  LocaleEnum value = LocaleEnum.eng;

  void onChange(LocaleEnum e) {
    setState(() {
      value = e;
    });
  }

  @override
  Widget build(BuildContext context) {
    return XOutlinedButton(
      child: DropdownButton(
        style: AppStyles.titleButtonSmall,
        icon: const Icon(
          Icons.expand_more,
          color: AppColors.slate_300,
        ),
        value: value,
        underline: const SizedBox(),
        items: _buildListItem(style: AppStyles.titleButtonShow),
        onChanged: (value) {
          if (value != null) {
            onChange(value);
          }
        },
        selectedItemBuilder: (context) {
          return _buildListItem(style: AppStyles.titleButtonSmall);
        },
      ),
    );
  }

  List<DropdownMenuItem<LocaleEnum>> _buildListItem({
    required TextStyle style,
  }) {
    return LocaleEnum.values.map((e) {
      return DropdownMenuItem(
        value: e,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              e.label == 'ENG'
                  ? 'assets/images/eng.png'
                  : 'assets/images/vie.png',
              height: 30,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              e.label,
              style: style,
            ),
          ],
        ),
      );
    }).toList();
  }
}
