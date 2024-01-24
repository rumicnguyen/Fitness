import 'package:fitness_app/src/features/home/logic/friends_activity_state.dart';
import 'package:fitness_app/src/network/domain_manager.dart';
import 'package:fitness_app/src/network/model/user_workout/user_workout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FriendsActivityBloc extends Cubit<FriendsActivityState> {
  FriendsActivityBloc() : super(FriendsActivityState.ds()) {
    syncData();
  }

  DomainManager get domain => DomainManager();

  Future syncData() async {
    const String id = 'friendId';
    if (id.isNotEmpty == true) {
      final result = await domain.user.getFriendsActivity(id: id);
      if (result.isSuccess && result.data != null) {
        changeList(result.data!);
      }
    }
  }

  void changeList(List<MUserWorkout> list) {
    List<MUserWorkout> datas = List.from(list);
    emit(state.copyWith(friendsActivity: datas));
  }
}
