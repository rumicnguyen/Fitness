import 'package:fitness_app/src/features/page_not_found/view/page_not_found_view.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/network/domain_manager.dart';
import 'package:fitness_app/src/network/model/workout/workout.dart';
import 'package:fitness_app/src/router/coordinator.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:fitness_app/widgets/button/button.dart';
import 'package:fitness_app/widgets/row_result.dart';
import 'package:fitness_app/widgets/scaffold.dart';
import 'package:fitness_app/widgets/section.dart';
import 'package:flutter/material.dart';

class WorkoutDetailView extends StatelessWidget {
  const WorkoutDetailView({
    super.key,
    required this.id,
  });

  final String id;

  Future fetchData() async {
    final result = await DomainManager().workout.getWorkoutById(id: id);
    if (result.isSuccess) {
      return result.data;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text(S.of(context).none);
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Text(S.of(context).waiting);
          case ConnectionState.done:
            if (snapshot.hasError) return const PageNotFoundView();
            return _buildBloc(context: context, item: snapshot.data);
        }
      },
    );
  }

  Widget _buildBloc({required BuildContext context, required MWorkout item}) {
    return XScaffold(
      enableAppbar: true,
      iconColor: AppColors.gray,
      actions: const [
        XSection(
          right: 20,
          child: Icon(
            Icons.bookmarks,
            color: AppColors.gray,
          ),
        )
      ],
      child: _builder(context: context, item: item),
    );
  }

  Widget _builder({required BuildContext context, required MWorkout item}) {
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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              item.backgroundImage,
              fit: BoxFit.fill,
            ),
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

  Widget _buildResult({required BuildContext context, required MWorkout item}) {
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

  Widget _buildButtonStart(
      {required BuildContext context, required MWorkout item}) {
    return XButton(
      width: double.infinity,
      height: 60,
      title: S.of(context).start_workout,
      onPressed: () {
        AppCoordinator.showStartWorkoutScreen(id: item.id);
      },
      titleStyle: AppStyles.whiteTextSmallB,
      backgroundColor: AppColors.second,
    );
  }
}
