import 'package:fitness_app/src/network/model/workout/workout.dart';
import 'package:fitness_app/src/router/coordinator.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:fitness_app/src/utils/string_utils.dart';
import 'package:fitness_app/widgets/image_widget.dart';
import 'package:flutter/material.dart';

class ViewItem extends StatelessWidget {
  const ViewItem({
    super.key,
    required this.item,
  });

  final MWorkout item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              AppCoordinator.showWorkoutDetailsScreen(id: item.id);
            },
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: AppColors.lightGray,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ImageWidget(
                image: item.thumbnail,
                borderRadius: 10,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: AppStyles.blackTextMidiumB,
              ),
              Text(
                StringUtils.shorten(item.name, length: 30),
                style: AppStyles.grayTextMidium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
