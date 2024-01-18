import 'package:fitness_app/src/features/setting/logic/setting_bloc.dart';
import 'package:fitness_app/src/features/setting/logic/setting_state.dart';
import 'package:fitness_app/src/network/data/enum/locale_enum.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:fitness_app/widgets/button/outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleDropDownButton extends StatelessWidget {
  const LocaleDropDownButton({super.key});

  @override
  Widget build(BuildContext context) {
    return XOutlinedButton(
      child: BlocBuilder<SettingBloc, SettingState>(
        buildWhen: (previous, current) {
          return previous.locale != current.locale;
        },
        builder: (context, state) {
          return DropdownButton(
            style: AppStyles.titleButtonSmall,
            icon: const Icon(
              Icons.expand_more,
              color: AppColors.slate_300,
            ),
            value: LocaleEnum.fromValue(state.locale),
            underline: const SizedBox(),
            items: _buildListItem(style: AppStyles.titleButtonShow),
            onChanged: (value) {
              if (value != null) {
                context.read<SettingBloc>().onChangeLocalizations(value.value);
              }
            },
            selectedItemBuilder: (context) {
              return _buildListItem(style: AppStyles.titleButtonSmall);
            },
          );
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
              e.image,
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
