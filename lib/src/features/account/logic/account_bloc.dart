import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:fitness_app/src/network/domain_manager.dart';
import 'package:fitness_app/src/network/model/user/user.dart';
import 'package:fitness_app/src/services/user_prefs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'account_state.dart';

class AccountBloc extends Cubit<AccountState> {
  AccountBloc() : super(AccountState.ds()) {
    // will be developed later
    // syncUserData();
  }

  StreamController<MUser> statusStream = StreamController.broadcast();
  DomainManager get domain => DomainManager();

  Future syncUserData() async {
    final String id = state.user.id;
    if (id.isNotEmpty == true) {
      final result = await domain.user.getUser(id: id);
      if (result.isSuccess) {
        onUserChange(state.copyWith(user: result.data));
      } else {
        onUserChange(state.logOut());
      }
    }
  }

  void onLoginSuccess(MUser user) {
    onUserChange(state.login(user));
  }

  void onUserChange(AccountState newstate) {
    // setup token and param http
    UserPrefs.instance.setUser(newstate.user);
    emit(newstate);
  }
}
