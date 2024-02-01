import 'package:fitness_app/src/features/account/logic/account_bloc.dart';
import 'package:fitness_app/src/features/account/widget/button_change_avatar_portals.dart';
import 'package:fitness_app/src/network/model/user/user.dart';
import 'package:fitness_app/src/services/user_prefs.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    MUser currentUser = UserPrefs.I.getUser() ?? MUser.empty();
    return BlocProvider<AccountBloc>(
      create: (BuildContext context) {
        return AccountBloc();
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Account screen'),
              const SizedBox(
                height: 30,
              ),
              XAvatar(
                avatar: currentUser.avatar,
                size: 100,
              ),
              const SizedBox(
                height: 30,
              ),
              const ButtonChangeAvatarPortals(),
            ],
          ),
        ),
      ),
    );
  }
}
