import 'package:fitness_app/gen/assets.gen.dart';
import 'package:fitness_app/src/network/data/enum/stats_type.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Stats<T> extends StatelessWidget {
  const Stats({
    super.key,
    required this.time,
    required this.value,
    required this.type,
  });

  final DateTime time;
  final T value;
  final StatsType type;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          _buildItem(),
        ],
      ),
    );
  }

  Widget _buildItem() {
    String startAt = DateFormat('dd MMM').format(time);
    String now = DateFormat('dd MMM').format(DateTime.now());
    if (time.year != DateTime.now().year) {
      startAt = DateFormat('MMM yyyy').format(time);
      now = DateFormat('MMM yyy').format(DateTime.now());
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 60,
              height: 60,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.second,
              ),
              child: type == StatsType.averageHeartRate
                  ? Image.asset(
                      Assets.images.pulse.path,
                    )
                  : Icon(
                      type.icon,
                      color: AppColors.white,
                    ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  type.label,
                  style: AppStyles.blackTextMidiumB,
                ),
                Text(
                  '$startAt - $now',
                  style: AppStyles.grayTextMidium,
                ),
              ],
            )
          ],
        ),
        SizedBox(
          width: 70,
          child: Center(
            child: Text(
              value.toString(),
              style: AppStyles.heading,
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
