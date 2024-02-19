import 'package:fitness_app/src/network/model/workout/workout.dart';
import 'package:fitness_app/src/router/coordinator.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:flutter/material.dart';

class MostPopularItem extends StatelessWidget {
  const MostPopularItem({
    super.key,
    required this.item,
    required this.image,
  });

  final MWorkout item;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppCoordinator.showWorkoutDetailsScreen(id: item.id);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.gray,
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.fill,
            opacity: 0.4,
          ),
        ),
        child: Center(
          child: Text(
            item.name,
            style: AppStyles.mostB,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
