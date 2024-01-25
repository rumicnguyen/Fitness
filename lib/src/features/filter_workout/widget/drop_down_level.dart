import 'package:fitness_app/src/features/filter_workout/logic/filter_workout_bloc.dart';
import 'package:fitness_app/src/features/filter_workout/logic/filter_workout_state.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/network/data/enum/workout_level.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:fitness_app/widgets/button/dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropDownLevel extends StatelessWidget {
  const DropDownLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterWorkoutBloc, FilterWorkoutState>(
      buildWhen: (previous, current) {
        return previous.levelOnFilter.value != current.levelOnFilter.value ||
            previous.level.value != current.levelOnFilter.value;
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).ability_level,
              style: AppStyles.heading,
            ),
            XDropDownButton(
              showIcon: state.level != state.levelOnFilter,
              onPressedIcon: () {
                context.read<FilterWorkoutBloc>().resetLevelOnFilter();
              },
              value: state.levelOnFilter.value,
              items: _buildListItem(currentItem: state.level),
              selectedItems: (context) {
                return _buildListItem(check: true, currentItem: state.level);
              },
              onChanged: (value) {
                if (value != null) {
                  context
                      .read<FilterWorkoutBloc>()
                      .setLevelOnFilter(WorkoutLevel.fromValue(value));
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
    required WorkoutLevel currentItem,
  }) {
    return WorkoutLevel.values.map((e) {
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
