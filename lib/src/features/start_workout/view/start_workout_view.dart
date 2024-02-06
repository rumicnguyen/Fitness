import 'package:fitness_app/src/features/start_workout/logic/start_workout_bloc.dart';
import 'package:fitness_app/src/features/start_workout/logic/start_workout_state.dart';
import 'package:fitness_app/src/features/start_workout/widget/exercise_item.dart';
import 'package:fitness_app/src/features/start_workout/widget/youtube_player.dart';
import 'package:fitness_app/src/network/model/common/handle.dart';
import 'package:fitness_app/src/router/coordinator.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:fitness_app/widgets/is_loading.dart';
import 'package:fitness_app/widgets/section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartWorkoutView extends StatelessWidget {
  const StartWorkoutView({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StartWorkoutBloc(id),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Stack(
          children: [
            Column(
              children: [
                _buildVideo(),
                _buildTitle(),
                _buildListExercise(),
              ],
            ),
            _buildLeadingIcon(),
          ],
        ),
      ),
    );
  }

  Widget _buildLeadingIcon() {
    return Positioned(
      top: 20,
      left: 30,
      child: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.black,
        ),
        onPressed: () {
          AppCoordinator.pop();
        },
      ),
    );
  }

  Widget _buildVideo() {
    return BlocConsumer<StartWorkoutBloc, StartWorkoutState>(
      listenWhen: (previous, current) => previous.handle != current.handle,
      listener: (context, state) {
        // TODO: implement listener
      },
      buildWhen: (previous, current) =>
          previous.workout != current.workout ||
          previous.handle != current.handle,
      builder: (context, state) {
        state.controller.addListener(() {
          if (state.controller.value.isFullScreen) {
            if (state.controller.value.position.inSeconds ==
                state.exercise[state.countTaskDone].endAt) {
              context.read<StartWorkoutBloc>().onIncreaseTaskDone();
            }
            if (state.controller.value.position.inSeconds ==
                state.exercise[state.current].endAt) {
              context.read<StartWorkoutBloc>().onIncreaseCurrent();
            }
          }
        });
        return state.handle.isLoading
            ? const SizedBox(
                height: 200,
                child: Loading(),
              )
            : XYoutubePlayer(
                controller: state.controller,
              );
      },
    );
  }

  Widget _buildTitle() {
    return BlocBuilder<StartWorkoutBloc, StartWorkoutState>(
      buildWhen: (previous, current) =>
          previous.countTaskDone != current.countTaskDone ||
          previous.handle != current.handle,
      builder: (context, state) {
        return Container(
          color: AppColors.gray_50,
          width: double.infinity,
          height: 70,
          child: state.handle == MHandle.loading()
              ? const SizedBox()
              : XSection(
                  horizontal: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        state.workout.name,
                        style: AppStyles.heading,
                      ),
                      Text(
                        '${state.countTaskDone}/${state.workout.exercises.toString()}',
                        style: AppStyles.blackTextMidium,
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }

  Widget _buildListExercise() {
    return BlocConsumer<StartWorkoutBloc, StartWorkoutState>(
      listenWhen: (previous, current) => previous.handle != current.handle,
      listener: (context, state) {
        // TODO: implement listener
      },
      buildWhen: (previous, current) =>
          previous.exercise != current.exercise ||
          previous.countTaskDone != current.countTaskDone ||
          previous.current != current.current ||
          previous.handle != current.handle,
      builder: (context, state) {
        return SizedBox(
          height: 490,
          child: state.handle.isLoading
              // Will be developed later
              ? const Loading()
              : ListView.builder(
                  itemCount: state.workout.exercises,
                  itemBuilder: (BuildContext context, int index) {
                    return ExerciseItem(
                      exercise: state.exercise[index],
                      isDoing: index == state.countTaskDone,
                      context: context,
                      isDone: index < state.countTaskDone,
                      onTap: () async {
                        if (index == 0) {
                          state.controller.seekTo(Duration.zero);
                        } else {
                          state.controller.seekTo(
                            Duration(seconds: state.exercise[index - 1].endAt),
                          );
                        }
                        const Loading().load(context
                            .read<StartWorkoutBloc>()
                            .onChangeCurrent(index));
                      },
                      isCurrent: state.current == index,
                    );
                  },
                ),
        );
      },
    );
  }
}
