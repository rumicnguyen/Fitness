import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:fitness_app/dialogs/toast_wrapper.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/network/data/enum/storage/storage_folder.dart';
import 'package:fitness_app/src/network/data/storage/firebase_storage_reference.dart';
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
    AppCoordinator.showSetGoalScreen();
  }

  Future onUpdateAvatar(String avatar) async {
    emit(state.copyWith(handle: MHandle.loading()));
    final storage = FirebaseStorageReference();
    final url = await storage.get(folder: StorageFolder.users, data: avatar);
    if (url.isError || url.data == null) {
      emit(state.copyWith(handle: MHandle.error(url.error)));
    }
    final result = await domain.user.update(user: state.user, avatar: url.data);
    if (result.isSuccess && result.data != null) {
      onUpdateUser(result.data!);
      emit(state.copyWith(
        user: result.data,
        handle: MHandle.result(result),
      ));
    } else {
      emit(state.copyWith(handle: MHandle.error(result.error)));
    }
  }

  Future onUpdateUser(MUser user) async {
    UserPrefs.instance.setUser(user);
    emit(state.copyWith(user: user));
    await syncUserData();
    XToast.hideLoading();
  }
}
