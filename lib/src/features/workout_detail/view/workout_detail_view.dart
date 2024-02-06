import 'package:fitness_app/src/features/workout_detail/logic/workout_detail_bloc.dart';
import 'package:fitness_app/src/features/workout_detail/logic/workout_detail_state.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/network/model/workout/workout.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:fitness_app/widgets/button/button.dart';
import 'package:fitness_app/widgets/is_loading.dart';
import 'package:fitness_app/widgets/row_result.dart';
import 'package:fitness_app/widgets/scaffold.dart';
import 'package:fitness_app/widgets/section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutDetailView extends StatelessWidget {
  const WorkoutDetailView({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WorkoutDetailBloc>(
      create: (context) => WorkoutDetailBloc(id),
      child: BlocConsumer<WorkoutDetailBloc, WorkoutDetailState>(
        listenWhen: (previous, current) => previous.handle != current.handle,
        listener: (context, state) {
          if (state.handle.isError) {
            // TODO: show toast
          }
        },
        buildWhen: (previous, current) =>
            previous.workout != current.workout ||
            previous.handle != current.handle,
        builder: (context, state) {
          return state.handle.isLoading
              ? const Loading()
              : _body(
                  context: context,
                  item: state.workout,
                );
        },
      ),
    );
  }

  Widget _body({
    required BuildContext context,
    required MWorkout item,
  }) {
    return BlocProvider<WorkoutDetailBloc>(
      create: (BuildContext context) {
        return WorkoutDetailBloc(id);
      },
      child: BlocBuilder<WorkoutDetailBloc, WorkoutDetailState>(
        buildWhen: (previous, current) {
          return previous.isFavorite != current.isFavorite ||
              previous.handle != current.handle;
        },
        builder: (context, state) {
          return XScaffold(
            enableAppbar: true,
            iconColor: AppColors.gray,
            actions: [
              XSection(
                right: 20,
                child: IconButton(
                  icon: const Icon(Icons.bookmarks),
                  color: state.isFavorite ? AppColors.second : AppColors.gray,
                  onPressed: () {
                    context.read<WorkoutDetailBloc>().onChangeFavorite();
                  },
                ),
              )
            ],
            child: _builder(context: context, item: item),
          );
        },
      ),
    );
  }

  Widget _builder({
    required BuildContext context,
    required MWorkout item,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: double.infinity,
          height: 350,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: AppColors.gray,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: BlocBuilder<WorkoutDetailBloc, WorkoutDetailState>(
            buildWhen: (previous, current) {
              return previous.backgroundImage != current.backgroundImage ||
                  previous.handle != current.handle;
            },
            builder: (context, state) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: state.backgroundImage.isNotEmpty
                    ? Image.network(
                        state.backgroundImage,
                        fit: BoxFit.fill,
                      )
                    : const Loading(),
              );
            },
          ),
        ),
        Text(
          item.name,
          style: AppStyles.mainTitle,
          textAlign: TextAlign.center,
        ),
        Column(
          children: [
            _buildResult(context: context, item: item),
            const SizedBox(
              height: 20,
            ),
            _buildButtonStart(context: context, item: item),
          ],
        ),
      ],
    );
  }

  Widget _buildResult({
    required BuildContext context,
    required MWorkout item,
  }) {
    return RowResult(
      firstItem: item.exercises.toString(),
      secondItem: item.level.value,
      thirthItem:
          '${item.minimumTime.toString()} ${S.of(context).symbol_center_line} ${item.maximumTime.toString()}',
      firstLabel: S.of(context).exercise_in_detail,
      secondLabel: S.of(context).level,
      thirthLabel: S.of(context).minutes,
    );
  }

  Widget _buildButtonStart({
    required BuildContext context,
    required MWorkout item,
  }) {
    return XButton(
      width: double.infinity,
      height: 60,
      title: S.of(context).start_workout,
      onPressed: () async {
        const Loading().load(
          context.read<WorkoutDetailBloc>().onStartWorkout(),
        );
      },
      titleStyle: AppStyles.whiteTextSmallB,
      backgroundColor: AppColors.second,
    );
  }
}
