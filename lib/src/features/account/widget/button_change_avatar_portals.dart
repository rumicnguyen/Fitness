import 'dart:io';

import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/network/data/enum/storage/storage_folder.dart';
import 'package:fitness_app/src/network/data/enum/storage/storage_type.dart';
import 'package:fitness_app/src/network/data/storage/firebase_storage_reference.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:fitness_app/widgets/button/text_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ButtonChangeAvatarPortals extends StatefulWidget {
  const ButtonChangeAvatarPortals({super.key});

  @override
  State<ButtonChangeAvatarPortals> createState() =>
      _ButtonChangeAvatarPortalsState();
}

class _ButtonChangeAvatarPortalsState extends State<ButtonChangeAvatarPortals> {
  final OverlayPortalController _controller = OverlayPortalController();
  final ref = FirebaseStorageReference();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _controller.toggle,
      child: DefaultTextStyle(
        style: DefaultTextStyle.of(context).style.copyWith(fontSize: 50),
        child: OverlayPortal(
          controller: _controller,
          overlayChildBuilder: (BuildContext context) {
            return Center(
              child: Container(
                height: 300,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.lightGray,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildButtonPortals(
                      title: S.of(context).from_gallery,
                      onPressed: () {
                        _pickImageFromGallery();
                      },
                    ),
                    _buildButtonPortals(
                      title: S.of(context).from_camera,
                      onPressed: () {
                        _pickImageFromCamera();
                      },
                    ),
                  ],
                ),
              ),
            );
          },
          child: Text(
            S.of(context).change_avatar,
            style: AppStyles.blackTextSmall,
          ),
        ),
      ),
    );
  }

  Widget _buildButtonPortals({
    required String title,
    required onPressed,
  }) {
    return XTextButton(
      title: title,
      style: AppStyles.blackTextLarge,
      onPressed: onPressed,
    );
  }

  Future _pickImageFromGallery() async {
    final PermissionStatus permissionStatus = await Permission.photos.request();
    if (permissionStatus == PermissionStatus.granted) {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image != null) {
        await ref.add(
          folder: StorageFolder.users,
          type: StorageType.image,
          file: File(image.path),
        );
      }
    }
  }

  Future _pickImageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      await ref.add(
        folder: StorageFolder.users,
        type: StorageType.image,
        file: File(image.path),
      );
    }
  }
}
