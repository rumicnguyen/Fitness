import 'package:fitness_app/dialogs/toast_wrapper.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:flutter/material.dart';

class IsLoading extends StatelessWidget {
  const IsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(S.of(context).is_loading),
    );
  }

  Future load(Future<dynamic> onLoad) async {
    XToast.showLoading();
    await onLoad;
    XToast.hideLoading();
  }
}
