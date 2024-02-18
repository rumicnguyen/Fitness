import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/network/data/enum/storage/storage_folder.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:fitness_app/widgets/image_widget.dart';
import 'package:flutter/material.dart';

enum LayoutType { card, grid, overload, none }

class XCardItem extends StatelessWidget {
  const XCardItem({
    super.key,
    this.child,
    this.tag,
    this.magin,
    this.backgroundImage,
    this.type,
    this.onTap,
    this.overload,
    this.width = 340,
    this.height = 230,
    this.image = '',
    this.folder = StorageFolder.workouts,
  });
  final int? tag;
  final Widget? child;
  final double width;
  final double height;
  final String image;
  final EdgeInsetsGeometry? magin;
  final Widget? backgroundImage;
  final LayoutType? type;
  final void Function()? onTap;
  final int? overload;
  final StorageFolder folder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: magin,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: _generateGradient(),
        ),
        child: _builder(context),
      ),
    );
  }

  Widget _builder(BuildContext context) {
    switch (type) {
      case LayoutType.none:
        return const Icon(
          Icons.add_circle,
          size: 30,
          color: AppColors.white,
        );
      case LayoutType.overload:
        return Center(
          child: Text(
            S.of(context).symbol_add + overload.toString(),
            style: AppStyles.overloadText,
          ),
        );
      default:
        return _buildStack(context);
    }
  }

  Widget _buildStack(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: backgroundImage ??
                ImageWidget(
                  width: width,
                  height: height,
                  image: image,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  folder: folder,
                ),
          ),
        ),
        Positioned(
          bottom: 15,
          left: 15,
          child: child ?? const SizedBox(),
        ),
        tag != null ? _buildTag(context) : Container(),
      ],
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
            _generateTag(context, tag ?? 0),
            style: AppStyles.primaryColorText,
          ),
        ),
      ),
    );
  }

  String _generateTag(BuildContext context, int tag) {
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

  Gradient _generateGradient() {
    switch (type) {
      case null || LayoutType.card:
        return const RadialGradient(
          colors: [
            AppColors.backgroundCardLight,
            AppColors.backgroundCardDark,
          ],
          center: Alignment.center,
          radius: 1.0,
        );
      case LayoutType.grid || LayoutType.overload:
        return const LinearGradient(
          colors: [
            AppColors.backgroundGridLight,
            AppColors.backgroundGridMiddleLight,
            AppColors.backgroundGridMiddleDark,
            AppColors.backgroundGridDark,
          ],
          begin: Alignment.centerRight,
          end: Alignment.bottomLeft,
        );
      default:
        return const LinearGradient(
          colors: [
            AppColors.slate_400,
            AppColors.gray_200,
          ],
          begin: Alignment.centerRight,
          end: Alignment.bottomLeft,
        );
    }
  }
}
