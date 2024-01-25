import 'package:fitness_app/src/features/filter_workout/logic/filter_workout_bloc.dart';
import 'package:fitness_app/src/features/filter_workout/logic/filter_workout_state.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/network/data/enum/discipline_activity.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:fitness_app/widgets/dropdown/dropdown_button.dart';
import 'package:fitness_app/widgets/dropdown/dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropDownDiscipline extends StatelessWidget {
  const DropDownDiscipline({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterWorkoutBloc, FilterWorkoutState>(
      buildWhen: (previous, current) {
        return previous.disciplineActivityOnFilter.value !=
                current.disciplineActivityOnFilter.value ||
            previous.disciplineActivity.value !=
                current.disciplineActivity.value;
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).discipline_activity,
              style: AppStyles.heading,
            ),
            XDropDownButton(
              showIcon:
                  state.disciplineActivity != state.disciplineActivityOnFilter,
              onPressedIcon: () {
                context
                    .read<FilterWorkoutBloc>()
                    .resetDisciplineActivityOnFilter();
              },
              value: state.disciplineActivityOnFilter.value,
              items: _buildList(value: state.disciplineActivity),
              selectedItems: (context) {
                return _buildList(
                  check: true,
                  value: state.disciplineActivity,
                );
              },
              onChanged: (value) {
                if (value != null) {
                  context
                      .read<FilterWorkoutBloc>()
                      .setDisciplineActivityOnFilter(
                          DisciplineActivity.fromValue(value));
                }
              },
            ),
          ],
        );
      },
    );
  }

  List<DropdownMenuItem<String>> _buildList({
    required DisciplineActivity value,
    bool check = false,
  }) {
    return DropDownItem.buildItem(
      check: check,
      currentItem: value,
      list: DisciplineActivity.values,
      getValue: (e) => e.value,
    );
  }
}
