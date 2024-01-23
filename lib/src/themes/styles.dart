import 'package:fitness_app/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class AppStyles {
  static const titleButtonSmall = TextStyle(
    fontSize: 16,
    color: AppColors.white,
    fontWeight: FontWeight.w400,
  );
  static const titleButtonShow = TextStyle(
    fontSize: 16,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
  );
  static const titleIntro = TextStyle(
    fontSize: 80,
    color: AppColors.white,
    fontWeight: FontWeight.w700,
  );

  static const whiteTextSmall = TextStyle(
    color: AppColors.white,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const whiteTextMidium = TextStyle(
    color: AppColors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const blackTextSmall = TextStyle(
    color: AppColors.black,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static const blackTextMidium = TextStyle(
    color: AppColors.black,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const grayTextSmall = TextStyle(
    color: AppColors.gray,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const whiteTextSmallU = TextStyle(
    color: AppColors.white,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.white,
  );

  static const grayTextSmallThin = TextStyle(
    color: AppColors.gray,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const grayTextMidium = TextStyle(
    color: AppColors.gray,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const grayTextMidiumU = TextStyle(
    color: AppColors.gray,
    fontSize: 15,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.gray,
  );

  static const signTitle = TextStyle(
    color: AppColors.white,
    fontSize: 34,
    wordSpacing: 0.8,
    fontFamily: FontFamily.avenirBold,
  );

  static const mainTitle = TextStyle(
    color: AppColors.black,
    fontSize: 28,
    fontFamily: FontFamily.avenirBold,
  );

  static const resultNumber = TextStyle(
    color: AppColors.resultNumber,
    fontSize: 24,
    fontFamily: FontFamily.avenirBold,
  );

  static const primaryColorText = TextStyle(
    color: AppColors.textButton,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const homeText = TextStyle(
    color: AppColors.gray_400,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const heading = TextStyle(
    color: AppColors.black,
    fontSize: 20,
    fontFamily: FontFamily.avenirBold,
  );
}
