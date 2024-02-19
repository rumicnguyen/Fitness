import 'package:fitness_app/src/features/goal/logic/goal_bloc.dart';
import 'package:fitness_app/src/features/goal/logic/goal_state.dart';
import 'package:fitness_app/src/network/model/goal/goal.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoalItemWidget extends StatelessWidget {
  const GoalItemWidget({
    super.key,
    required this.goal,
    this.showIcon = false,
  });

  final MGoal goal;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoalBloc, GoalState>(
      buildWhen: (previous, current) =>
          previous.goals != current.goals ||
          previous.listGoal != current.listGoal,
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(
              color: AppColors.gray,
              width: 1,
            ),
          ),
          child: state.goals.contains(goal) && showIcon
              ? TextButton.icon(
                  onPressed: () {
                    context.read<GoalBloc>().removeGoal(goal);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: AppColors.black,
                  ),
                  label: Text(
                    goal.goal,
                    style: AppStyles.blackTextMidium,
                  ),
                )
              : TextButton(
                  onPressed: () { 
                    context.read<GoalBloc>().addGoal(goal);
                  },
                  child: Text(
                    goal.goal,
                    style: AppStyles.blackTextMidium,
                  ),
                ),
        );
      },
    );
  }
}
