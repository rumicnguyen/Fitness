import 'package:fitness_app/src/features/filter_workout/logic/filter_workout_bloc.dart';
import 'package:fitness_app/src/features/filter_workout/logic/filter_workout_state.dart';
import 'package:fitness_app/src/features/filter_workout/widget/drop_down_discipline.dart';
import 'package:fitness_app/src/features/filter_workout/widget/drop_down_entry_fee.dart';
import 'package:fitness_app/src/features/filter_workout/widget/drop_down_level.dart';
import 'package:fitness_app/src/features/filter_workout/widget/drop_down_time.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
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
                  const DropDownDiscipline(),
                  _buildSpacing(),
                  const DropDownEntryFee(),
                  _buildSpacing(),
                  const DropDownTime(),
                  _buildSpacing(),
                  const DropDownLevel(),
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
