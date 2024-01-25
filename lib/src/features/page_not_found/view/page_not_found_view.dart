import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:flutter/material.dart';

class PageNotFoundView extends StatelessWidget {
  const PageNotFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.transparent,
        foregroundColor: AppColors.second,
      ),
      body: Center(
        child: Text(
          S.of(context).page_not_found,
          style: AppStyles.blackTextLarge,
        ),
      ),
    );
  }
}
