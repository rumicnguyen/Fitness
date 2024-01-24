import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:flutter/material.dart';

class XCardItem extends StatelessWidget {
  const XCardItem({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.image,
    this.tag,
    this.magin,
    this.backgroundImage,
  });
  final int? tag;
  final Widget child;
  final double? width;
  final double? height;
  final String? image;
  final EdgeInsetsGeometry? magin;
  final Image? backgroundImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: magin,
      width: width ?? 340,
      height: height ?? 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const RadialGradient(
          colors: [
            AppColors.backgroundCardLight,
            AppColors.backgroundCardDark,
          ],
          center: Alignment.center,
          radius: 1.0,
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: backgroundImage ??
                Image.asset(
                  image ?? '',
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  width: width ?? 340,
                  height: height ?? 230,
                ),
          ),
          Positioned(
            bottom: 5,
            left: 5,
            child: child,
          ),
          tag != null ? _buildTag(context) : Container(),
        ],
      ),
    );
  }

  Widget _buildTag(BuildContext context) {
    return Positioned(
      top: 15,
      right: 0,
      child: Container(
        width: 110,
        height: 40,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100),
            bottomLeft: Radius.circular(100),
          ),
          border: Border(
            right: BorderSide(
              width: 1,
              color: AppColors.gray_200,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.boxShadow,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            generateTag(context, tag ?? 0),
            style: AppStyles.primaryColorText,
          ),
        ),
      ),
    );
  }

  String generateTag(BuildContext context, int tag) {
    switch (tag) {
      case 1:
        return S.of(context).tag_1st;
      case 2:
        return S.of(context).tag_2nd;
      case 3:
        return S.of(context).tag_3rd;
      default:
        return '$tag ${S.of(context).tag_th}';
    }
  }
}
