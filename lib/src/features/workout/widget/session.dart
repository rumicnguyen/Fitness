import 'package:fitness_app/src/features/home/widget/block.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/network/model/workout/workout.dart';
import 'package:fitness_app/src/router/coordinator.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:flutter/material.dart';

class Session extends StatelessWidget {
  const Session({
    super.key,
    required this.item,
    required this.label,
  });

  final List<MWorkout> item;
  final String label;

  @override
  Widget build(BuildContext context) {
    return XBlock(
      header: label,
      onPressed: () {},
      enableActions: false,
      height: 250,
      child: _buildListView(item, context),
    );
  }

  Widget _buildListView(List<MWorkout> list, BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (_, index) {
        return GestureDetector(
          onTap: () {
            AppCoordinator.showWorkoutDetailsScreen(id: list[index].id);
          },
          child: _buildItem(list[index], context),
        );
      },
    );
  }

  Widget _buildCartTitle(MWorkout item, BuildContext context) {
    final String description =
        '${item.exercises} ${S.of(context).exercises} ${S.of(context).symbol_space} ${item.level.value} ${S.of(context).level}';
    return SizedBox(
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.name,
            style: AppStyles.blackTextSmallB,
          ),
          Text(
            description,
            style: AppStyles.grayTextMidium,
          )
        ],
      ),
    );
  }

  Widget _buildItem(MWorkout item, BuildContext context) {
    const double width = 200;
    const double height = 150;

    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(
                colors: [
                  AppColors.bgBottom,
                  AppColors.second,
                ],
              ),
            ),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  item.thumbnail,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  width: width,
                  height: height,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          _buildCartTitle(item, context),
        ],
      ),
    );
  }
}
