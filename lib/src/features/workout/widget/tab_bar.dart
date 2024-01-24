import 'package:fitness_app/src/features/workout/logic/workout_bloc.dart';
import 'package:fitness_app/src/features/workout/logic/workout_state.dart';
import 'package:fitness_app/src/network/data/enum/tab_bar_workout.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XTabBar extends StatelessWidget {
  const XTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTab(TabBarWorkout.forYou, context),
        _buildTab(TabBarWorkout.mostPopular, context),
        _buildTab(TabBarWorkout.proPlan, context),
      ],
    );
  }

  Widget _buildTab(TabBarWorkout item, BuildContext context) {
    return BlocBuilder<WorkoutBloc, WorkoutState>(
      buildWhen: (previous, current) {
        return previous.currentTab != current.currentTab;
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            if (item != TabBarWorkout.proPlan) {
              context.read<WorkoutBloc>().onChangedTab(item);
            }
          },
          child: Text(
            item.value,
            style: state.currentTab == item
                ? AppStyles.blackTextLarge
                : AppStyles.grayTextLarge,
          ),
        );
      },
    );
  }
}
