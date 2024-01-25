import 'package:fitness_app/src/features/filter_workout/logic/filter_workout_bloc.dart';
import 'package:fitness_app/src/features/filter_workout/logic/filter_workout_state.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/network/data/enum/entry_fee.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:fitness_app/widgets/button/dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropDownEntryFee extends StatelessWidget {
  const DropDownEntryFee({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterWorkoutBloc, FilterWorkoutState>(
      buildWhen: (previous, current) {
        return previous.entryFeeOnFilter.value !=
                current.entryFeeOnFilter.value ||
            previous.entryFee.value != current.entryFee.value;
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).entry_fee,
              style: AppStyles.heading,
            ),
            XDropDownButton(
              showIcon: state.entryFee != state.entryFeeOnFilter,
              value: state.entryFeeOnFilter.value,
              onPressedIcon: () {
                context.read<FilterWorkoutBloc>().resetEntryFeeOnFilter();
              },
              items: _buildListItem(currentItem: state.entryFee),
              selectedItems: (context) {
                return _buildListItem(check: true, currentItem: state.entryFee);
              },
              onChanged: (value) {
                if (value != null) {
                  context
                      .read<FilterWorkoutBloc>()
                      .setEntryFeeOnFilter(EntryFee.fromValue(value));
                }
              },
            ),
          ],
        );
      },
    );
  }

  List<DropdownMenuItem<String>> _buildListItem({
    bool check = false,
    required EntryFee currentItem,
  }) {
    return EntryFee.values.map((e) {
      return DropdownMenuItem(
        value: e.value,
        child: Text(
          e.value,
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
