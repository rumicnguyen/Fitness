import 'package:fitness_app/gen/assets.gen.dart';
import 'package:fitness_app/src/features/intro/logic/intro_bloc.dart';
import 'package:fitness_app/src/features/intro/widget/locale_dropdown_button.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:fitness_app/widgets/button/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.intro.path),
            fit: BoxFit.fill,
          ),
          gradient: const LinearGradient(
            colors: [
              AppColors.first,
              AppColors.second,
              AppColors.thirth,
            ],
            transform: GradientRotation(90),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const LocaleDropDownButton(),
            _buildTitle(context),
            XTextButton(
              title: S.of(context).get_started,
              ending: const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(
                  Icons.arrow_right_alt,
                  color: AppColors.white,
                ),
              ),
              onPressed: () {
                context.read<IntroBloc>().isSignInUser();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          S.of(context).intro_title,
          style: AppStyles.titleIntro,
        ),
        Text(
          S.of(context).intro_description,
          style: AppStyles.titleButtonSmall,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
