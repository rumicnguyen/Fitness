import 'package:fitness_app/dialogs/toast_wrapper.dart';
import 'package:fitness_app/src/features/account/logic/account_bloc.dart';
import 'package:fitness_app/src/features/goal/logic/goal_state.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/network/domain_manager.dart';
import 'package:fitness_app/src/network/model/common/handle.dart';
import 'package:fitness_app/src/network/model/goal/goal.dart';
import 'package:fitness_app/src/network/model/user/user.dart';
import 'package:fitness_app/src/router/coordinator.dart';
import 'package:fitness_app/src/router/route_name.dart';
import 'package:fitness_app/src/services/user_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoalBloc extends Cubit<GoalState> {
  GoalBloc() : super(GoalState.ds()) {
    syncData();
  }

  DomainManager get domain => DomainManager();
  MUser user = UserPrefs.I.getUser() ?? MUser.empty();

  Future syncData() async {
    emit(state.copyWith(handle: MHandle.loading()));
    final listGoal = await domain.goal.getGoals();
    if (listGoal.isSuccess && listGoal.data != null) {
      emit(state.copyWith(listGoal: listGoal.data!));
    }

    List<MGoal> goals = [];

    for (var element in user.target) {
      final result = await domain.goal.getGoalFrom(goal: element);
      if (result.isSuccess && result.data != null) {
        goals.add(result.data!);
      }
    }

    emit(state.copyWith(goals: goals));
    emit(state.copyWith(handle: MHandle.result(listGoal)));
  }

  void addGoal(MGoal goal) {
    List<MGoal> list = List.from(state.goals);
    if (!list.contains(goal)) {
      if (list.length >= 5) {
        XToast.error(S.text.toast_maximum_goal_is_5);
        return;
      }
      list.add(goal);
    }
    emit(state.copyWith(goals: list));
  }

  void removeGoal(MGoal goal) {
    List<MGoal> list = List.from(state.goals);
    if (list.contains(goal)) {
      list.remove(goal);
    }
    emit(state.copyWith(goals: list));
  }

  Future onConfirm(BuildContext context) async {
    emit(state.copyWith(handle: MHandle.loading()));
    final list = state.goals.map((e) => e.goal).toList();
    final result = await domain.user.update(user: user, target: list);

    if (result.isError || result.data == null) {
      XToast.error(S.text.toast_update_failt);
    } else {
      XToast.success(S.text.toast_update_success);
      if (context.mounted) {
        context.read<AccountBloc>().onUpdateUser(result.data!);
      }
      await domain.user.update(user: user, target: result.data!.target);
    }

    AppCoordinator.goNamed(AppRouteNames.account.name);
    emit(state.copyWith(handle: MHandle.result(result)));
  }
}
