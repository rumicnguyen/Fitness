import 'package:fitness_app/src/features/intro/widget/locale_dropdown_button.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:fitness_app/widgets/button/text_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Title and backgroundImage screen will be developed later
///
/// Design miss image
class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          // This UI will be developed latter.
          image: DecorationImage(
            image: AssetImage('assets/images/intro.png'),
            fit: BoxFit.fill,
          ),
          gradient: LinearGradient(
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
            _buildTitle(),
            XTextButton(
              title: 'Get Started',
              ending: const Padding(
                padding: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                child: Icon(
                  Icons.arrow_right_alt,
                  color: AppColors.white,
                ),
              ),
              onPressed: () {
                context.go('/home');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // This UI will be developed latter.
        Text(
          'MYFIT',
          style: AppStyles.titleIntro,
        ),
        Text(
          'This App will help you\n keep your body fit and strong',
          style: AppStyles.titleButtonSmall,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
