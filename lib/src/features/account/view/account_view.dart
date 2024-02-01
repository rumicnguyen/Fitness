import 'package:fitness_app/src/features/account/logic/account_bloc.dart';
import 'package:fitness_app/src/features/account/widget/button_change_avatar_portals.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
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
              _buildAvatar(),
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

  Widget _buildAvatar() {
    return BlocBuilder<AccountBloc, AccountState>(
      buildWhen: (previous, current) {
        return previous.user != current.user;
      },
      builder: (context, state) {
        return XAvatar(
          avatar: state.user.avatar,
          size: 100,
        );
      },
    );
  }
}
