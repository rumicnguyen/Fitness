import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fitness_app/src/network/data/enum/storage/storage_folder.dart';
import 'package:fitness_app/src/network/data/enum/storage/storage_type.dart';
import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/utils/string_utils.dart';

class FirebaseStorageReference {
  final storage = FirebaseStorage.instance;

  Future<MResult<String>> add({
    required StorageType type,
    required StorageFolder folder,
    required File file,
  }) async {
    try {
      final String fileName = StringUtils.generateIdImageName();
      final folders = storage.ref().child(folder.value);
      final types = folders.child(type.value);
      final files = types.child(fileName);
      UploadTask uploadTask = files.putFile(file);
      await uploadTask.whenComplete(() {
        return MResult.success('Upload $fileName success');
      });
      return MResult.error('Upload $fileName failed');
    } on FirebaseException catch (e) {
      return MResult.exception(e.message);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<String>> get({
    StorageType type = StorageType.image,
    required StorageFolder folder,
    required String data,
  }) async {
    try {
      final folders = storage.ref().child(folder.value);
      final types = folders.child(type.value);
      final files = types.child(data);
      final result = await files.getDownloadURL();
      return MResult.success(result);
    } on FirebaseException catch (e) {
      return MResult.exception(e.message);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<String>> delete({
    required StorageType type,
    required StorageFolder folder,
    required String data,
  }) async {
    try {
      final folders = storage.ref().child(folder.value);
      final types = folders.child(type.value);
      final files = types.child(data);
      await files.delete();
      return MResult.success('Delete file success');
    } on FirebaseException catch (e) {
      return MResult.exception(e.message);
    } catch (e) {
      return MResult.exception(e);
    }
  }
}
