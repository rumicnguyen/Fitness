import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:flutter/material.dart';

class RowResult extends StatelessWidget {
  const RowResult({
    super.key,
    required this.firstItem,
    required this.secondItem,
    required this.thirthItem,
    required this.firstLabel,
    required this.secondLabel,
    required this.thirthLabel,
  });

  final String firstItem;
  final String secondItem;
  final String thirthItem;
  final String firstLabel;
  final String secondLabel;
  final String thirthLabel;
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildItem(
          item: firstItem,
          label: firstLabel,
        ),
        _buildLine(),
        _buildItem(
          item: secondItem,
          label: secondLabel,
        ),
        _buildLine(),
        _buildItem(
          item: thirthItem,
          label: thirthLabel,
        ),
      ],
    );
  }

  Widget _buildItem({required String item, required String label}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          item,
          style: AppStyles.resultNumber,
          textAlign: TextAlign.center,
        ),
        Text(
          label,
          style: AppStyles.homeText,
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Widget _buildLine() {
    return Container(
      width: 2,
      height: 50,
      color: AppColors.gray_300,
    );
  }
}
