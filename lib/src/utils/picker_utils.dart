import 'dart:io';

import 'package:fitness_app/src/network/data/enum/storage/storage_folder.dart';
import 'package:fitness_app/src/network/data/enum/storage/storage_type.dart';
import 'package:fitness_app/src/network/data/storage/firebase_storage_reference.dart';
import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/utils/permission_utils.dart';
import 'package:fitness_app/src/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class PickerUtils {
  static final ref = FirebaseStorageReference();

  static Future<MResult> pickImageFromGallery({
    required StorageFolder folder,
    required BuildContext context,
  }) async {
    try {
      final permission = await PermissionUtils.requestPermission(
        permission: Permission.photos,
        context: context,
      );
      if (permission.isSuccess) {
        final result = await PickerUtils.pickImage(
          source: ImageSource.gallery,
          folder: folder,
        );
        if (result.isSuccess) {
          return MResult.success(result.data);
        }
      }
      return MResult.error('error');
    } catch (e) {
      return MResult.exception(e);
    }
  }
  static Future<MResult> pickImageFromCamera({
    required StorageFolder folder,
    required BuildContext context,
  }) async {
    try {
      final permission = await PermissionUtils.requestPermission(
        permission: Permission.camera,
        context: context,
      );
      if (permission.isSuccess) {
        final result = await PickerUtils.pickImage(
          source: ImageSource.camera,
          folder: folder,
        );
        if (result.isSuccess) {
          return MResult.success(result.data);
        }
      }
      return MResult.error('error');
    } catch (e) {
      return MResult.exception(e);
    }
  }

  static Future<MResult<String>> pickImage({
    required ImageSource source,
    required StorageFolder folder,
  }) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      final String fileName = StringUtils.generateIdImageName();
      if (image != null) {
        await ref.add(
          folder: StorageFolder.users,
          type: StorageType.image,
          file: File(image.path),
          fileName: fileName,
        );
        return MResult.success(fileName);
      }
      return MResult.error('error');
    } catch (e) {
      return MResult.exception(e);
    }
  }
}
