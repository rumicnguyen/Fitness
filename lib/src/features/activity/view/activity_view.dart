import 'package:fitness_app/src/features/activity/logic/activity_bloc.dart';
import 'package:fitness_app/src/features/activity/logic/activity_state.dart';
import 'package:fitness_app/src/features/activity/widget/activity_tab_bar.dart';
import 'package:fitness_app/src/features/activity/widget/overall_stats.dart';
import 'package:fitness_app/src/features/bar_chart/view/bar_chart.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/widgets/loading.dart';
import 'package:fitness_app/widgets/scaffold.dart';
import 'package:fitness_app/widgets/title/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return XScaffold(
      child: BlocProvider<ActivityBloc>(
        create: (context) => ActivityBloc(),
        child: BlocBuilder<ActivityBloc, ActivityState>(
          buildWhen: (previous, current) => previous.handle != current.handle,
          builder: (context, state) {
            return state.handle.isLoading
                ? const Loading()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      XTitle(
                        height: 100,
                        title: S.of(context).activity,
                      ),
                      _body(),
                    ],
                  );
          },
        ),
      ),
    );
  }

  Widget _body() {
    return BlocBuilder<ActivityBloc, ActivityState>(
      buildWhen: (previous, current) {
        return previous.currentTab != current.currentTab;
      },
      builder: (context, state) {
        Size screenSize = MediaQuery.of(context).size;
        return Column(
          children: [
            const ActivityTabBar(),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: (screenSize.height - 240) <= 0
                  ? screenSize.height
                  : screenSize.height - 240,
              width: double.infinity,
              child: const SingleChildScrollView(
                child: Column(
                  children: [
                    XBarChart(),
                    SizedBox(
                      height: 15,
                    ),
                    OverallStats(),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
