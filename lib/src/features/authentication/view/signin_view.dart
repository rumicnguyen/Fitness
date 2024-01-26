import 'package:fitness_app/gen/assets.gen.dart';
import 'package:fitness_app/src/features/authentication/widget/scaffold.dart';
import 'package:fitness_app/src/features/authentication/widget/sign_title.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/network/model/user/user.dart';
import 'package:fitness_app/src/router/coordinator.dart';
import 'package:fitness_app/src/services/user_prefs.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:fitness_app/widgets/button/button.dart';
import 'package:fitness_app/widgets/button/text_button.dart';
import 'package:fitness_app/widgets/forms/input.dart';
import 'package:fitness_app/widgets/section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return SignScaffold(
      actions: [
        XSection(
          right: 10.0,
          child: XTextButton(
            title: S.of(context).sign_up,
            onPressed: () {
              AppCoordinator.showSignUpScreen();
            },
            style: AppStyles.whiteTextSmallU,
          ),
        ),
      ],
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
          title: S.of(context).sign_in_title,
          guide: S.of(context).sign_in_guide,
        ),
        const SizedBox(
          height: 80,
        ),
        _buildForm(context),
        const SizedBox(
          height: 20,
        ),
        _buildForgotPassword(context),
        const SizedBox(
          height: 80,
        ),
        _buildButton(context),
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
          key: Key(S.of(context).sign_in_key_password),
          value: 'password',
          /*
          Will be developed in logic task
          onChanged: context.read<SigninBloc>().onPasswordChanged,
          */
          onChanged: null,
          obscureText: true,
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
      ],
    );
  }

  Widget _buildForgotPassword(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        XTextButton(
          title: S.of(context).sign_in_forgot_password,
          style: AppStyles.grayTextMidiumU,
          onPressed: AppCoordinator.showForgotPasswordScreen,
        ),
      ],
    );
  }

  Padding _buildLineDivider(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const Expanded(child: Divider()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              S.of(context).or,
              style: AppStyles.grayTextMidium,
            ),
          ),
          const Expanded(child: Divider()),
        ],
      ),
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
            S.of(context).sign_in,
            style: AppStyles.blackTextMidium,
          ),
          onPressed: () {
            if (UserPrefs.I.getUser() == null) {
              UserPrefs.instance.setUser(MUser(
                id: '1',
                avatar: Assets.images.avatar.path,
                challengeParticipatedIn: 7,
                hoursTraining: 245,
                workoutsCompleted: 17,
                name: 'Mary',
              ));
            }
            AppCoordinator.showHomeScreen();
          },
        ),
        _buildLineDivider(context),
        XButton(
          width: double.infinity,
          height: 60.0,
          icon: SvgPicture.asset(
            Assets.svgs.icGoogle,
            width: 38,
            height: 38,
          ),
          backgroundColor: AppColors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 7.0),
            child: Text(
              S.of(context).sign_in_with_google,
              style: AppStyles.blackTextMidium,
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
