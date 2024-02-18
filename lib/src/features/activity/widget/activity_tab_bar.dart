import 'package:fitness_app/src/features/activity/logic/activity_bloc.dart';
import 'package:fitness_app/src/features/activity/logic/activity_state.dart';
import 'package:fitness_app/src/network/data/enum/date_filter.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivityTabBar extends StatelessWidget {
  const ActivityTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildTab(DateFilter.weekly, context),
        const SizedBox(
          width: 15,
        ),
        _buildTab(DateFilter.monthly, context),
        const SizedBox(
          width: 15,
        ),
        _buildTab(DateFilter.allTime, context),
      ],
    );
  }

  Widget _buildTab(DateFilter item, BuildContext context) {
    return BlocBuilder<ActivityBloc, ActivityState>(
      buildWhen: (previous, current) {
        return previous.currentTab != current.currentTab;
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<ActivityBloc>().onChangedTab(item);
          },
          child: Text(
            item.value,
            style: state.currentTab == item
                ? AppStyles.blackTextLarge
                : AppStyles.grayTextLarge,
          ),
        );
      },
    );
  }
}
