import 'package:fitness_app/src/features/filter_workout/logic/filter_workout_bloc.dart';
import 'package:fitness_app/src/features/filter_workout/logic/filter_workout_state.dart';
import 'package:fitness_app/src/features/filter_workout/widget/filter_dropdown.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/network/data/enum/discipline_activity.dart';
import 'package:fitness_app/src/network/data/enum/entry_fee.dart';
import 'package:fitness_app/src/network/data/enum/time_filter.dart';
import 'package:fitness_app/src/network/data/enum/workout_level.dart';
import 'package:fitness_app/src/router/coordinator.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:fitness_app/widgets/button/button.dart';
import 'package:fitness_app/widgets/scaffold.dart';
import 'package:fitness_app/widgets/section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterWorkoutView extends StatelessWidget {
  const FilterWorkoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return XScaffold(
      child: BlocProvider<FilterWorkoutBloc>(
        create: (context) {
          return FilterWorkoutBloc();
        },
        child: XSection(
          top: 40,
          child: BlocBuilder<FilterWorkoutBloc, FilterWorkoutState>(
            buildWhen: (previous, current) {
              return previous.isApply(current);
            },
            builder: (context, state) {
              return Column(
                children: [
                  _buildAppBar(context),
                  _buildSpacing(),
                  _buildDiscipline(),
                  _buildSpacing(),
                  _buildEntryFee(),
                  _buildSpacing(),
                  _buildTime(),
                  _buildSpacing(),
                  _buildLevel(),
                  _buildSpacing(),
                  _buildButtonApply(context),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSpacing() {
    return const SizedBox(
      height: 20,
    );
  }

  Widget _buildDiscipline() {
    return BlocBuilder<FilterWorkoutBloc, FilterWorkoutState>(
      buildWhen: (previous, current) {
        return previous.disciplineActivityOnFilter.value !=
                current.disciplineActivityOnFilter.value ||
            previous.disciplineActivity.value !=
                current.disciplineActivity.value;
      },
      builder: (context, state) {
        return FilterDropdown(
          header: S.of(context).discipline_activity,
          list: DisciplineActivity.values,
          value: state.disciplineActivity,
          valueOnFilter: state.disciplineActivityOnFilter,
          onChanged: (value) {
            if (value != null) {
              context.read<FilterWorkoutBloc>().setDisciplineActivityOnFilter(
                  DisciplineActivity.fromValue(value));
            }
          },
          onPressedIcon: () {
            context.read<FilterWorkoutBloc>().resetDisciplineActivityOnFilter();
          },
          getValue: (e) => e.value,
        );
      },
    );
  }

  Widget _buildEntryFee() {
    return BlocBuilder<FilterWorkoutBloc, FilterWorkoutState>(
      buildWhen: (previous, current) {
        return previous.entryFeeOnFilter.value !=
                current.entryFeeOnFilter.value ||
            previous.entryFee.value != current.entryFee.value;
      },
      builder: (context, state) {
        return FilterDropdown(
          header: S.of(context).entry_fee,
          list: EntryFee.values,
          value: state.entryFee,
          valueOnFilter: state.entryFeeOnFilter,
          onChanged: (value) {
            if (value != null) {
              context
                  .read<FilterWorkoutBloc>()
                  .setEntryFeeOnFilter(EntryFee.fromValue(value));
            }
          },
          onPressedIcon: () {
            context.read<FilterWorkoutBloc>().resetEntryFeeOnFilter();
          },
          getValue: (e) => e.value,
        );
      },
    );
  }

  Widget _buildTime() {
    return BlocBuilder<FilterWorkoutBloc, FilterWorkoutState>(
      buildWhen: (previous, current) {
        return previous.timeOnFilter.value != current.timeOnFilter.value ||
            previous.time.value != current.time.value;
      },
      builder: (context, state) {
        return FilterDropdown(
          header: S.of(context).entry_fee,
          list: TimeFilter.values,
          value: state.time,
          valueOnFilter: state.timeOnFilter,
          onChanged: (value) {
            if (value != null) {
              context
                  .read<FilterWorkoutBloc>()
                  .setTimeOnFilter(TimeFilter.fromValue(value));
            }
          },
          onPressedIcon: () {
            context.read<FilterWorkoutBloc>().resetTimeOnFilter();
          },
          getValue: (e) => e.value,
        );
      },
    );
  }

  Widget _buildLevel() {
    return BlocBuilder<FilterWorkoutBloc, FilterWorkoutState>(
      buildWhen: (previous, current) {
        return previous.levelOnFilter.value != current.levelOnFilter.value ||
            previous.level.value != current.level.value;
      },
      builder: (context, state) {
        return FilterDropdown(
          header: S.of(context).entry_fee,
          list: WorkoutLevel.values,
          value: state.level,
          valueOnFilter: state.levelOnFilter,
          onChanged: (value) {
            if (value != null) {
              context
                  .read<FilterWorkoutBloc>()
                  .setLevelOnFilter(WorkoutLevel.fromValue(value));
            }
          },
          onPressedIcon: () {
            context.read<FilterWorkoutBloc>().resetLevelOnFilter();
          },
          getValue: (e) => e.value,
        );
      },
    );
  }

  Widget _buildButtonApply(BuildContext context) {
    return XButton(
      width: double.infinity,
      height: 60,
      title: S.of(context).apply_filters,
      onPressed: () {
        context.read<FilterWorkoutBloc>().apply();
      },
      titleStyle: AppStyles.whiteTextSmallB,
      backgroundColor: AppColors.second,
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildEventText(
          () {
            AppCoordinator.pop();
          },
          S.of(context).cancel,
        ),
        Text(
          S.of(context).workouts,
          style: AppStyles.heading,
        ),
        _buildEventText(
          () {
            context.read<FilterWorkoutBloc>().resetAll();
          },
          S.of(context).reset_all,
        ),
      ],
    );
  }

  Widget _buildEventText(onTap, String title) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: AppStyles.filterText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
