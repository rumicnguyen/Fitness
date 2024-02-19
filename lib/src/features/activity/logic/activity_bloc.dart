import 'package:fitness_app/dialogs/toast_wrapper.dart';
import 'package:fitness_app/src/features/activity/logic/activity_state.dart';
import 'package:fitness_app/src/network/data/enum/date_filter.dart';
import 'package:fitness_app/src/network/domain_manager.dart';
import 'package:fitness_app/src/network/model/activity/activity.dart';
import 'package:fitness_app/src/network/model/activity/activity_detail/activity_detail.dart';
import 'package:fitness_app/src/network/model/common/handle.dart';
import 'package:fitness_app/src/network/model/user/user.dart';
import 'package:fitness_app/src/services/user_prefs.dart';
import 'package:fitness_app/src/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivityBloc extends Cubit<ActivityState> {
  ActivityBloc() : super(ActivityState.ds()) {
    syncData();
  }

  DomainManager get domain => DomainManager();
  final user = UserPrefs.I.getUser() ?? MUser.empty();

  Future syncData() async {
    emit(state.copyWith(handle: MHandle.loading()));
    XToast.showLoading();

    onChangedTab(DateFilter.weekly);

    emit(state.copyWith(handle: MHandle.completed('')));
    XToast.hideLoading();
  }

  void onChangedTab(DateFilter tab) {
    if (tab == state.currentTab) {
      return;
    }
    switch (tab) {
      case DateFilter.weekly:
        onPressedWeekly();
      case DateFilter.monthly:
        onPressedMonthly();
      default:
        onPressedAllTime();
    }
  }

  Future onPressedWeekly() async {
    emit(state.copyWith(handle: MHandle.loading()));
    XToast.showLoading();

    final activities =
        await domain.activity.getWeeklyActivityUser(userId: user.id);
    if (activities.isSuccess && activities.data != null) {
      onPressedTab(
        filter: DateFilter.weekly,
        activities: activities.data!,
        startAt: Utils.firstDayOfCurrentWeek(),
        activityDetails: [],
      );
    }

    XToast.hideLoading();
    emit(state.copyWith(handle: MHandle.completed('')));
  }

  Future onPressedMonthly() async {
    emit(state.copyWith(handle: MHandle.loading()));
    XToast.showLoading();

    final activities =
        await domain.activity.getMonthlyActivityUser(userId: user.id);
    if (activities.isSuccess && activities.data != null) {
      onPressedTab(
        filter: DateFilter.monthly,
        activities: activities.data!,
        startAt: Utils.firstDayOfCurrentMonth(),
        activityDetails: [],
      );
    }

    XToast.hideLoading();
    emit(state.copyWith(handle: MHandle.completed('')));
  }

  Future onPressedAllTime() async {
    emit(state.copyWith(handle: MHandle.loading()));
    XToast.showLoading();

    final activities = await domain.activity.getActivitiesUser(userId: user.id);

    if (activities.isSuccess && activities.data != null) {
      onPressedTab(
        filter: DateFilter.allTime,
        activities: activities.data!,
        startAt: user.createdAt ?? DateTime(2024),
        activityDetails: [],
      );
    }

    XToast.hideLoading();
    emit(state.copyWith(handle: MHandle.completed('')));
  }

  Future onPressedTab({
    required DateFilter filter,
    required List<MActivity> activities,
    required DateTime startAt,
    required List<MActivityDetail> activityDetails,
  }) async {
    emit(state.copyWith(handle: MHandle.loading()));
    XToast.showLoading();

    int workoutsCompleted = 0;
    int hoursTraining = 0;
    int challengeParticipatedIn = 0;
    int averageHeartRate = 0;
    int kilocaloriesBurned = 0;
    int kilometresRun = 0;

    for (var element in activities) {
      workoutsCompleted += element.workoutsCompleted;
      hoursTraining += element.hours;
      challengeParticipatedIn += element.challengeParticipatedIn;
      averageHeartRate += element.averageHeartRate;
      kilocaloriesBurned += element.kilocaloriesBurned;
      kilometresRun += element.kilometresRun;
    }

    emit(state.copyWith(
      workoutsCompleted: workoutsCompleted,
      hoursTraining: hoursTraining,
      challengeParticipatedIn: challengeParticipatedIn,
      averageHeartRate: averageHeartRate,
      kilocaloriesBurned: kilocaloriesBurned,
      kilometresRun: kilometresRun,
      startAt: startAt,
      currentTab: filter,
      activityDetails: activityDetails,
    ));

    XToast.hideLoading();
    emit(state.copyWith(handle: MHandle.completed('')));
  }
}
