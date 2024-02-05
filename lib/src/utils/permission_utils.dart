import 'package:fitness_app/dialogs/toast_wrapper.dart';
import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionUtils {
  static Future<MResult> requestPermission({
    required Permission permission,
    required BuildContext context,
  }) async {
    final status = await permission.request();

    if (!status.isGranted) {
      XToast.error(
          'Permission denied. Please grant the permission in the app settings.');
      return MResult.error('Permission denied');
    }
    return MResult.success('Permission granted');
  }
}
