import 'package:fitness_app/src/features/account/logic/account_bloc.dart';
import 'package:fitness_app/src/themes/colors.dart';
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
      child: const Scaffold(
        backgroundColor: AppColors.white,
        body: Center(
          child: Text('Account screen'),
        ),
      ),
    );
  }
}
