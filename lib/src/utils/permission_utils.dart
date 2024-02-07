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

    switch (status) {
      case PermissionStatus.denied:
        XToast.error(
            'Permission denied. Please grant the permission in the app settings.');
        return MResult.error('Permission denied');
      case PermissionStatus.limited:
        XToast.error(
            'Permission limited. Please grant the permission in the app settings.');
        return MResult.error('Permission limited');
      case PermissionStatus.permanentlyDenied:
        XToast.error(
            'Permission permanently denied. Please grant the permission in the app settings.');
        return MResult.error('Permission permanently denied');
      case PermissionStatus.provisional:
        XToast.error(
            'Permission provisional. Please grant the permission in the app settings.');
        return MResult.error('Permission provisional');
      case PermissionStatus.restricted:
        XToast.error(
            'Permission restricted. Please grant the permission in the app settings.');
        return MResult.error('Permission restricted');
      default:
        return MResult.success('Permission granted');
    }
  }
}
