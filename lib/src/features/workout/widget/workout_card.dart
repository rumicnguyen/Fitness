import 'package:card_swiper/card_swiper.dart';
import 'package:fitness_app/gen/assets.gen.dart';
import 'package:fitness_app/src/features/home/widget/block.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/network/data/enum/workout_level.dart';
import 'package:fitness_app/src/network/model/workout/workout.dart';
import 'package:fitness_app/src/router/coordinator.dart';
import 'package:fitness_app/widgets/card_item/card_item.dart';
import 'package:fitness_app/widgets/card_item/card_title.dart';
import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({
    super.key,
    this.item,
    required this.label,
  });

  final List<MWorkout>? item;
  final String label;

  @override
  Widget build(BuildContext context) {
    MWorkout empty = MWorkout(
      id: '1',
      level: WorkoutLevel.none,
      thumbnail: Assets.images.comingSoon.path,
      members: 0,
      name: S.of(context).coming_soon,
    );

    return XBlock(
      header: label,
      onPressed: () {},
      child: item?.isNotEmpty == true
          ? _buildListView(item ?? [])
          : _buildEmptyItem(empty),
    );
  }

  Widget _buildListView(List<MWorkout> list) {
    return Swiper(
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (_, index) {
        return _buildListViewItem(list[index]);
      },
    );
  }

  Widget _buildCartTitle(MWorkout item) {
    return XCartTitle(
      title: item.name,
      members: item.members,
      level: item.level,
    );
  }

  Widget _buildListViewItem(MWorkout item) {
    return XCardItem(
      magin: const EdgeInsets.symmetric(horizontal: 2.0),
      width: 340,
      height: 230,
      tag: item.tag,
      image: item.thumbnail,
      onTap: () {
        AppCoordinator.showWorkoutDetailsScreen(id: item.id);
      },
      child: _buildCartTitle(item),
    );
  }

  Widget _buildEmptyItem(MWorkout item) {
    return XCardItem(
      magin: const EdgeInsets.symmetric(horizontal: 2.0),
      width: 340,
      height: 230,
      tag: item.tag,
      backgroundImage: Image.asset(
        item.thumbnail,
        fit: BoxFit.fill,
        alignment: Alignment.topCenter,
      ),
      child: _buildCartTitle(item),
    );
  }
}
