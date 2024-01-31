import 'package:fitness_app/src/features/authentication/logic/sign_up_bloc.dart';
import 'package:fitness_app/src/features/authentication/widget/scaffold.dart';
import 'package:fitness_app/src/features/authentication/widget/sign_title.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:fitness_app/widgets/button/button.dart';
import 'package:fitness_app/widgets/forms/input.dart';
import 'package:fitness_app/widgets/section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return SignScaffold(
      child: XSection(
        bottom: 30.0,
        left: 30.0,
        right: 30.0,
        child: BlocProvider<SignUpBloc>(
          create: (context) {
            return SignUpBloc();
          },
          child: BlocBuilder<SignUpBloc, SignUpState>(
            builder: (context, state) {
              return _buider(context);
            },
          ),
        ),
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
        _inputEmail(),
        const SizedBox(height: 16.0),
        _inputPassword(),
        const SizedBox(height: 16.0),
        _inputConfirmPassword(),
      ],
    );
  }

  Widget _inputEmail() {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) {
        return previous.email != current.email;
      },
      builder: (context, state) {
        return XInput(
          key: Key(S.of(context).sign_up_key_username),
          value: state.email.value,
          onChanged: context.read<SignUpBloc>().onEmailChanged,
          style: AppStyles.whiteTextMidium,
          labelStyle: AppStyles.whiteTextMidium,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: S.of(context).sign_in_accout_lable,
            errorText: state.email.errorOf(context),
          ),
        );
      },
    );
  }

  Widget _inputPassword() {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) {
        return previous.password != current.password;
      },
      builder: (context, state) {
        return XInput(
          key: Key(S.of(context).sign_up_key_password),
          value: state.password.value,
          onChanged: context.read<SignUpBloc>().onPasswordChanged,
          obscureText: true,
          style: AppStyles.whiteTextMidium,
          labelStyle: AppStyles.whiteTextMidium,
          decoration: InputDecoration(
            labelText: S.of(context).sign_in_password_lable,
            errorText: state.password.errorOf(context),
          ),
        );
      },
    );
  }

  Widget _inputConfirmPassword() {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) {
        return previous.confirmPassword != current.confirmPassword;
      },
      builder: (context, state) {
        return XInput(
          key: Key(S.of(context).sign_up_key_confirm_password),
          value: state.confirmPassword.value,
          onChanged: context.read<SignUpBloc>().onConfirmPasswordChanged,
          obscureText: true,
          style: AppStyles.whiteTextMidium,
          labelStyle: AppStyles.whiteTextMidium,
          decoration: InputDecoration(
            labelText: S.of(context).sign_up_confirm_password_lable,
            errorText: state.confirmPassword.errorOf(context),
          ),
        );
      },
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
            context.read<SignUpBloc>().signupWithEmail(context);
          },
        ),
      ],
    );
  }
}
