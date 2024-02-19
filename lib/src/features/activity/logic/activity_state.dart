import 'package:equatable/equatable.dart';

import 'package:fitness_app/src/network/data/enum/date_filter.dart';
import 'package:fitness_app/src/network/model/activity/activity.dart';
import 'package:fitness_app/src/network/model/activity/activity_detail/activity_detail.dart';
import 'package:fitness_app/src/network/model/common/handle.dart';

class ActivityState extends Equatable {
  final MHandle handle;
  
  final List<MActivityDetail> activityDetails;
  final DateFilter currentTab;
  final DateTime startAt;

  final int workoutsCompleted;
  final int hoursTraining;
  final int challengeParticipatedIn;

  final int averageHeartRate;
  final int kilocaloriesBurned;
  final int kilometresRun;

  const ActivityState({
    required this.handle,
    required this.activityDetails,
    required this.currentTab,
    required this.startAt,
    required this.workoutsCompleted,
    required this.hoursTraining,
    required this.challengeParticipatedIn,
    required this.averageHeartRate,
    required this.kilocaloriesBurned,
    required this.kilometresRun,
  });

  factory ActivityState.ds() => ActivityState(
        handle: MHandle(),
        currentTab: DateFilter.any,
        activityDetails: const [],
        workoutsCompleted: 0,
        hoursTraining: 0,
        challengeParticipatedIn: 0,
        averageHeartRate: 0,
        kilocaloriesBurned: 0,
        kilometresRun: 0,
        startAt: DateTime.now(),
      );

  ActivityState copyWith({
    MHandle? handle,
    MActivity? activities,
    List<MActivityDetail>? activityDetails,
    DateFilter? currentTab,
    DateTime? startAt,
    int? workoutsCompleted,
    int? hoursTraining,
    int? challengeParticipatedIn,
    int? averageHeartRate,
    int? kilocaloriesBurned,
    int? kilometresRun,
  }) {
    return ActivityState(
      handle: handle ?? this.handle,
      activityDetails: activityDetails ?? this.activityDetails,
      currentTab: currentTab ?? this.currentTab,
      startAt: startAt ?? this.startAt,
      workoutsCompleted: workoutsCompleted ?? this.workoutsCompleted,
      hoursTraining: hoursTraining ?? this.hoursTraining,
      challengeParticipatedIn:
          challengeParticipatedIn ?? this.challengeParticipatedIn,
      averageHeartRate: averageHeartRate ?? this.averageHeartRate,
      kilocaloriesBurned: kilocaloriesBurned ?? this.kilocaloriesBurned,
      kilometresRun: kilometresRun ?? this.kilometresRun,
    );
  }

  @override
  List<Object> get props {
    return [
      handle,
      activityDetails,
      currentTab,
      startAt,
      workoutsCompleted,
      hoursTraining,
      challengeParticipatedIn,
      averageHeartRate,
      kilocaloriesBurned,
      kilometresRun,
    ];
  }
}
