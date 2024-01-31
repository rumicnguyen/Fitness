import 'package:fitness_app/src/features/authentication/logic/forgot_bloc.dart';
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

class ForgotView extends StatelessWidget {
  const ForgotView({super.key});

  @override
  Widget build(BuildContext context) {
    return SignScaffold(
      child: BlocProvider<ForgotBloc>(
        create: (context) {
          return ForgotBloc();
        },
        child: XSection(
          all: 30.0,
          child: BlocBuilder<ForgotBloc, ForgotState>(
            buildWhen: (previous, current) {
              return false;
            },
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
          title: S.of(context).forgot_title,
          guide: S.of(context).forgot_guide,
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
    return BlocBuilder<ForgotBloc, ForgotState>(
      buildWhen: (previous, current) {
        return previous.email != current.email;
      },
      builder: (context, state) {
        return XInput(
          value: state.email.value,
          key: Key(S.of(context).forgot_key_email),
          onChanged: context.read<ForgotBloc>().onEmailChanged,
          style: AppStyles.whiteTextMidium,
          labelStyle: AppStyles.whiteTextMidium,
          decoration: InputDecoration(
            labelText: S.of(context).forgot_email_lable,
            errorText: state.email.errorOf(context) ??
                (state.error.isEmpty ? null : state.error),
          ),
        );
      },
    );
  }

  Widget _buildButton(BuildContext context) {
    return XButton(
      width: double.infinity,
      height: 60.0,
      backgroundColor: AppColors.white,
      child: Text(
        S.of(context).forgot_confirm,
        style: AppStyles.blackTextMidium,
      ),
      onPressed: () {
        context.read<ForgotBloc>().forgotPassword(context);
      },
    );
  }
}
