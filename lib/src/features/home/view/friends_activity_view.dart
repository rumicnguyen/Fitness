import 'package:fitness_app/src/features/home/logic/home_bloc.dart';
import 'package:fitness_app/src/features/home/logic/home_state.dart';
import 'package:fitness_app/src/features/home/widget/block.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/network/model/user_workout/user_workout.dart';
import 'package:fitness_app/src/router/coordinator.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:fitness_app/src/utils/string_utils.dart';
import 'package:fitness_app/widgets/card_item/card_item.dart';
import 'package:fitness_app/widgets/grid.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FriendsActivityView extends StatelessWidget {
  const FriendsActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return XBlock(
      header: S.of(context).friends_activity,
      type: LayoutType.grid,
      onPressed: () {},
      child: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) {
          return previous.friendsActivity != current.friendsActivity;
        },
        builder: (context, state) {
          List<MUserWorkout> list = List.from(state.friendsActivity);
          return _builder(context, list);
        },
      ),
    );
  }

  Widget _builder(BuildContext context, List<MUserWorkout> list) {
    switch (list.length) {
      case 0:
        return _buildNoneItem(context);
      case 1:
        return _buildItem(
          item: list[0],
          context: context,
        );
      default:
        return XGrid(
          firstItem: _buildItem(
            item: list[0],
            context: context,
          ),
          secondItem: _buildItem(
            item: list[1],
            context: context,
          ),
          thirthItem: list.length == 2
              ? _buildNoneItem(context)
              : list.length == 3
                  ? _buildItem(
                      item: list[2],
                      context: context,
                    )
                  : _buildOverloadItem(context, list.length),
        );
    }
  }

  Widget _buildOverloadItem(BuildContext context, int length) {
    return _buildItem(
      item: const MUserWorkout(id: ''),
      context: context,
      type: LayoutType.overload,
      overload: length - 2,
    );
  }

  Widget _buildNoneItem(BuildContext context) {
    return _buildItem(
      item: const MUserWorkout(id: ''),
      context: context,
      type: LayoutType.none,
    );
  }

  Widget _buildTitle(MUserWorkout item, BuildContext context) {
    final String title = StringUtils.shorten(
        '${S.of(context).completed} ${item.workoutName ?? ''}');
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.userName ?? '',
          style: AppStyles.whiteTextSmallB,
        ),
        Text(
          title,
          style: AppStyles.whiteTextSmall,
        ),
      ],
    );
  }

  Widget _buildItem({
    required MUserWorkout item,
    required BuildContext context,
    LayoutType type = LayoutType.grid,
    int overload = 0,
  }) {
    return XCardItem(
      type: type,
      image: item.workoutImage,
      overload: overload,
      onTap: () {
        print(item.idWorkout);
        if (type != LayoutType.overload && item.idWorkout != null) {
          AppCoordinator.showWorkoutDetailsScreen(id: item.idWorkout!);
        }
        // develop later
        // if item.idWorkout.isEmpty => show make friend
        // if overload => show List view
      },
      width: 340,
      height: 230,
      child: type != LayoutType.none
          ? _buildTitle(item, context)
          : const SizedBox(),
    );
  }
}
