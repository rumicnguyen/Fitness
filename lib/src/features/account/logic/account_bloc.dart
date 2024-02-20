import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/network/domain_manager.dart';
import 'package:fitness_app/src/network/model/common/handle.dart';
import 'package:fitness_app/src/network/model/user/user.dart';
import 'package:fitness_app/src/router/coordinator.dart';
import 'package:fitness_app/src/services/user_prefs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'account_state.dart';

class AccountBloc extends Cubit<AccountState> {
  AccountBloc() : super(AccountState.ds()) {
    syncUserData();
  }

  StreamController<MUser> statusStream = StreamController.broadcast();
  DomainManager get domain => DomainManager();

  Future syncUserData() async {
    emit(state.copyWith(handle: MHandle.loading()));
    final String id = state.user.id;
    if (id.isNotEmpty == true) {
      final result = await domain.user.getUser(id: id);
      if (result.isSuccess) {
        final friends = await domain.user.getFriendsUser(id: id);
        if (friends.isSuccess && friends.data != null) {
          onUserChange(state.copyWith(
            user: result.data,
            friends: friends.data!,
          ));
        } else {
          onUserChange(state.copyWith(user: result.data));
        }
        emit(state.copyWith(handle: MHandle.result(result)));
      } else {
        emit(state.copyWith(handle: MHandle.error(S.text.error)));
        onUserChange(state.logOut());
      }
    }
  }

  void onLoginSuccess(MUser user) {
    onUserChange(state.login(user));
  }

  void onUserChange(AccountState newstate) {
    UserPrefs.instance.setUser(newstate.user);
    emit(newstate);
  }

  void onFriendChange(List<MUser> friends) {
    emit(state.copyWith(friends: friends));
  }

  void onEdit(bool value) {
    emit(state.copyWith(isChanging: value));
    AppCoordinator.showSetGoalScreen();
  }

  Future onUpdateAvatar(String avatar) async {
    final result = await domain.user.update(user: state.user, avatar: avatar);
    if (result.isSuccess) {
      UserPrefs.instance.setUser(result.data);
      emit(state.copyWith(user: result.data));
    }
  }
}
