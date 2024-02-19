import 'package:fitness_app/src/network/model/workout/workout.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:fitness_app/src/utils/string_utils.dart';
import 'package:fitness_app/widgets/image_widget.dart';
import 'package:flutter/material.dart';

class ChallengeDetailItem extends StatelessWidget {
  const ChallengeDetailItem({
    super.key,
    required this.item,
  });

  final MWorkout item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: ImageWidget(
              image: item.thumbnail,
              borderRadius: 10,
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
