import 'package:equatable/equatable.dart';
import 'package:fitness_app/src/network/model/user_workout/user_workout.dart';

class FriendsActivityState extends Equatable {
  final List<MUserWorkout> friendsActivity;
  const FriendsActivityState({
    required this.friendsActivity,
  });

  factory FriendsActivityState.ds() => const FriendsActivityState(friendsActivity: []);

  FriendsActivityState copyWith({
    List<MUserWorkout>? friendsActivity,
  }) {
    return FriendsActivityState(
      friendsActivity: friendsActivity ?? this.friendsActivity,
    );
  }

  @override
  List<Object> get props => [friendsActivity];
}
