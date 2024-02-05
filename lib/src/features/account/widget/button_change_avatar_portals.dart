import 'package:fitness_app/src/features/account/logic/account_bloc.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/network/data/enum/storage/storage_folder.dart';
import 'package:fitness_app/src/network/data/enum/storage/storage_type.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:fitness_app/src/utils/permission_utils.dart';
import 'package:fitness_app/src/utils/picker_utils.dart';
import 'package:fitness_app/widgets/button/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _controller.toggle,
      child: DefaultTextStyle(
        style: DefaultTextStyle.of(context).style.copyWith(fontSize: 50),
        child: OverlayPortal(
          controller: _controller,
          overlayChildBuilder: (BuildContext context) {
            return Positioned(
              top: 5,
              right: 5,
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
                        _pickImageFromGallery(context);
                      },
                    ),
                    _buildButtonPortals(
                      title: S.of(context).from_camera,
                      onPressed: () {
                        _pickImageFromCamera(context);
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

  Future _pickImageFromGallery(BuildContext context) async {
    final permission = await PermissionUtils.requestPermission(
      permission: Permission.photos,
      context: context,
    );

    if (permission.isSuccess) {
      final result = await PickerUtils.pickImage(
        source: ImageSource.gallery,
        type: StorageType.image,
        folder: StorageFolder.users,
      );

      if (context.mounted && result.isSuccess) {
        await context.read<AccountBloc>().onUpdateAvatar(result.data);
      }
    }
  }

  Future _pickImageFromCamera(BuildContext context) async {
    final permission = await PermissionUtils.requestPermission(
      permission: Permission.camera,
      context: context,
    );
    if (permission.isSuccess) {
      final result = await PickerUtils.pickImage(
        source: ImageSource.camera,
        type: StorageType.image,
        folder: StorageFolder.users,
      );
      if (context.mounted && result.isSuccess) {
        await context.read<AccountBloc>().onUpdateAvatar(result.data);
      }
    }
  }
}
