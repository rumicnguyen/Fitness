import 'package:fitness_app/src/features/authentication/widget/scaffold.dart';
import 'package:fitness_app/src/features/authentication/widget/sign_title.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/router/coordinator.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:fitness_app/widgets/button/button.dart';
import 'package:fitness_app/widgets/forms/input.dart';
import 'package:fitness_app/widgets/section.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return XScaffold(
      child: XSection(
        bottom: 30.0,
        left: 30.0,
        right: 30.0,
        child: _buider(context),
      ),
    );
  }

  Widget _buider(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SignTitle(
          title: S.of(context).sign_up_title,
          guide: S.of(context).sign_up_guide,
        ),
        const SizedBox(
          height: 60,
        ),
        _buildForm(context),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          height: 90,
        ),
        _buildButton(context),
      ],
    );
  }

  Widget _buildForm(BuildContext context) {
    return Column(
      children: [
        XInput(
          key: Key(S.of(context).sign_up_key_username),
          value: '',
          /*
          Will be developed in logic task
          onChanged: context.read<SigninBloc>().onEmailChanged,
          */
          onChanged: null,
          style: AppStyles.whiteTextMidium,
          labelStyle: AppStyles.whiteTextMidium,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: S.of(context).sign_in_accout_lable,
            /*
            Will be developed in logic task
            errorText: 'state.email.errorOf(context)',
            */
          ),
        ),
        const SizedBox(height: 16.0),
        XInput(
          key: Key(S.of(context).sign_up_key_password),
          value: 'password',
          /*
          Will be developed in logic task
          onChanged: context.read<SigninBloc>().onPasswordChanged,
          */
          onChanged: null,
          style: AppStyles.whiteTextMidium,
          labelStyle: AppStyles.whiteTextMidium,
          decoration: InputDecoration(
            labelText: S.of(context).sign_in_password_lable,
            /*
            Will be developed in logic task
            errorText: 'state.password.errorOf(context)',
            */
          ),
        ),
        const SizedBox(height: 16.0),
        XInput(
          key: Key(S.of(context).sign_up_key_confirm_password),
          value: 'password',
          /*
          Will be developed in logic task
          onChanged: context.read<SigninBloc>().onPasswordChanged,
          */
          onChanged: null,
          style: AppStyles.whiteTextMidium,
          labelStyle: AppStyles.whiteTextMidium,
          decoration: InputDecoration(
            labelText: S.of(context).sign_up_confirm_password_lable,
            /*
            Will be developed in logic task
            errorText: 'state.password.errorOf(context)',
            */
          ),
        ),
      ],
    );
  }

  Widget _buildButton(BuildContext context) {
    return Column(
      children: [
        XButton(
          width: double.infinity,
          height: 60.0,
          backgroundColor: AppColors.white,
          child: Text(
            S.of(context).sign_up,
            style: AppStyles.blackTextMidium,
          ),
          onPressed: () {
            AppCoordinator.pop();
          },
        ),
      ],
    );
  }
}
