import 'dart:io';

import 'package:fitness_app/src/network/data/enum/storage/storage_folder.dart';
import 'package:fitness_app/src/network/data/enum/storage/storage_type.dart';
import 'package:fitness_app/src/network/data/storage/firebase_storage_reference.dart';
import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/utils/string_utils.dart';
import 'package:image_picker/image_picker.dart';

class PickerUtils {
  static final ref = FirebaseStorageReference();

  static Future<MResult> pickImage({
    required ImageSource source,
    required StorageType type,
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
