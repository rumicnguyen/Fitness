import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/network/model/exercise/exercise.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/widgets/section.dart';
import 'package:flutter/material.dart';

class ExerciseItem extends StatelessWidget {
  const ExerciseItem({
    super.key,
    required this.exercise,
    required this.isDoing,
    required this.context,
    required this.isDone,
    required this.isCurrent,
    this.onTap,
  });

  final MExercise exercise;
  final bool isDoing;
  final BuildContext context;
  final bool isDone;
  final bool isCurrent;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
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
