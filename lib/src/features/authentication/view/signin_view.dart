import 'package:fitness_app/src/features/authentication/widget/sign_title.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/router/coordinator.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:fitness_app/widgets/button/button.dart';
import 'package:fitness_app/widgets/button/text_button.dart';
import 'package:fitness_app/widgets/forms/input.dart';
import 'package:fitness_app/widgets/section.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.second,
              AppColors.thirth,
            ],
            transform: GradientRotation(90),
          ),
        ),
        child: XSection(
          top: 20.0,
          bottom: 30.0,
          left: 15.0,
          right: 15.0,
          child: _buider(context),
        ),
      ),
    );
  }

  Widget _buider(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildAppBar(context),
        SignTitle(
          title: S.of(context).sign_in_title,
          guide: S.of(context).sign_in_guide,
        ),
        const SizedBox(
          height: 100,
        ),
        _buildForm(context),
        const SizedBox(
          height: 20,
        ),
        _buildForgotPassword(context),
        const SizedBox(
          height: 100,
        ),
        XButton(
          width: double.infinity,
          height: 60.0,
          backgroundColor: AppColors.second,
          child: Text(
            S.of(context).sign_in,
            style: AppStyles.whiteTextMidium,
          ),
          onPressed: () {
            AppCoordinator.showHomeScreen();
          },
        ),
      ],
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        XTextButton(
          title: S.of(context).back,
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.gray,
          ),
          style: AppStyles.grayTextSmall,
          onPressed: () {
            AppCoordinator.pop();
          },
        ),
        XTextButton(
          title: S.of(context).sign_up,
          onPressed: () {
            AppCoordinator.showSignUpScreen();
          },
        ),
      ],
    );
  }

  Widget _buildForm(BuildContext context) {
    return Column(
      children: [
        XInput(
          key: Key(S.of(context).sign_in_key_username),
          value: '',
          /*
          Will be developed in logic task
          onChanged: context.read<SigninBloc>().onEmailChanged,
          */
          onChanged: null,
          labelStyle: AppStyles.grayTextMidium,
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
          key: Key(S.of(context).sign_in_key_password),
          value: '',
          /*
          Will be developed in logic task
          onChanged: context.read<SigninBloc>().onPasswordChanged,
          */
          onChanged: null,
          obscureText: true,
          labelStyle: AppStyles.grayTextMidium,
          decoration: InputDecoration(
            labelText: S.of(context).sign_in_password_lable,
            /*
            Will be developed in logic task
            errorText: 'state.password.errorOf(context)',
            */
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPassword(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: XTextButton(
        title: S.of(context).sign_in_forgot_password,
        style: AppStyles.grayTextMidium,
        onPressed: AppCoordinator.showForgotPasswordScreen,
      ),
    );
  }
}
