import 'package:fitness_app/src/features/start_workout/logic/start_workout_bloc.dart';
import 'package:fitness_app/src/features/start_workout/logic/start_workout_state.dart';
import 'package:fitness_app/src/features/start_workout/widget/youtube_player.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/network/model/common/handle.dart';
import 'package:fitness_app/src/network/model/exercise/exercise.dart';
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
            // Will be developed later
            ? const SizedBox(
                height: 200,
                child: IsLoading(),
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
              ? const IsLoading()
              : ListView.builder(
                  itemCount: state.workout.exercises,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildExerciseItem(
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
                        const IsLoading().load(context
                            .read<StartWorkoutBloc>()
                            .onChangeCurrent(index));
                      },
                      isCurrent: state.current == index,
                    );
                  },
                  // controller: ScrollController,
                ),
        );
      },
    );
  }

  Widget _buildExerciseItem({
    required MExercise exercise,
    required bool isDoing,
    required BuildContext context,
    required bool isDone,
    required bool isCurrent,
    onTap,
  }) {
    final Color mainColor = isDoing ? AppColors.second : AppColors.first;
    final Color textColor = isDoing ? AppColors.gray_500 : AppColors.gray_300;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        width: double.infinity,
        color: isDoing
            ? AppColors.gray_200
            : (isCurrent ? AppColors.red_100 : AppColors.white),
        child: XSection(
          horizontal: 30,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: mainColor,
                  width: 2,
                ),
              ),
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exercise.name,
                      style: TextStyle(
                        color: mainColor,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.refresh,
                          color: textColor,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          exercise.sets.toString() + S.of(context).sets,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 16,
                          ),
                        ),
                        Container(
                          width: 2,
                          height: 20,
                          color: mainColor,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                        ),
                        Icon(
                          Icons.watch_later_outlined,
                          color: textColor,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          exercise.minRest.toString() + S.of(context).min_rest,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  child: Icon(
                    Icons.check_circle_outline_outlined,
                    color:
                        isDoing || !isDone ? AppColors.first : AppColors.thirth,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
