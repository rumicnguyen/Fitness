import 'package:fitness_app/dialogs/toast_wrapper.dart';
import 'package:fitness_app/src/features/goal/logic/goal_bloc.dart';
import 'package:fitness_app/src/features/goal/logic/goal_state.dart';
import 'package:fitness_app/src/features/goal/widget/goal_item_widget.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/network/model/goal/goal.dart';
import 'package:fitness_app/src/router/coordinator.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:fitness_app/widgets/button/button.dart';
import 'package:fitness_app/widgets/loading.dart';
import 'package:fitness_app/widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoalView extends StatelessWidget {
  const GoalView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GoalBloc>(
      create: (context) => GoalBloc(),
      child: BlocConsumer<GoalBloc, GoalState>(
        listenWhen: (previous, current) => previous.handle != current.handle,
        listener: (context, state) {
          state.handle.isLoading ? XToast.showLoading() : XToast.hideLoading();
          if (state.handle.isError) {
            XToast.error(state.handle.message);
          }
        },
        buildWhen: (previous, current) => previous.handle != current.handle,
        builder: (context, state) {
          return XScaffold(
            enableAppbar: !state.handle.isLoading,
            iconColor: AppColors.transparent,
            actions: [
              IconButton(
                onPressed: () {
                  AppCoordinator.pop();
                },
                icon: const Icon(
                  Icons.close,
                  color: AppColors.black,
                ),
              ),
            ],
            child: state.handle.isLoading
                ? const Loading()
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).profile_set_goal,
                          style: AppStyles.mainTitle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        _body(context),
                        const SizedBox(
                          height: 20,
                        ),
                        _buildButtonApply(context),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }

  Widget _body(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.height - 230,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _yourGoal(),
            const SizedBox(
              height: 15,
            ),
            _buildListGoal(),
          ],
        ),
      ),
    );
  }

  Widget _buildWrap({
    required List<MGoal> list,
    required String title,
    bool? showIcon,
  }) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.blackTextLarge,
          ),
          const SizedBox(
            height: 15,
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: 10,
            runSpacing: 10,
            children: list
                .map((e) => GoalItemWidget(
                      goal: e,
                      showIcon: showIcon ?? false,
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _yourGoal() {
    return BlocBuilder<GoalBloc, GoalState>(
      buildWhen: (previous, current) =>
          previous.handle != current.handle || previous.goals != current.goals,
      builder: (context, state) {
        return _buildWrap(
          list: state.goals,
          title: S.of(context).profile_your_goal,
          showIcon: true,
        );
      },
    );
  }

  Widget _buildListGoal() {
    return BlocBuilder<GoalBloc, GoalState>(
      buildWhen: (previous, current) =>
          previous.handle != current.handle ||
          previous.listGoal != current.listGoal,
      builder: (context, state) {
        return _buildWrap(
          list: state.listGoal,
          title: S.of(context).profile_list_goal,
        );
      },
    );
  }

  Widget _buildButtonApply(BuildContext context) {
    return XButton(
      width: double.infinity,
      height: 60,
      title: S.of(context).forgot_confirm,
      onPressed: () async {
        context.read<GoalBloc>().onConfirm();
      },
      titleStyle: AppStyles.whiteTextSmallB,
      backgroundColor: AppColors.second,
    );
  }
}
