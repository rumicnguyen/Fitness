import 'package:fitness_app/dialogs/toast_wrapper.dart';
import 'package:fitness_app/gen/assets.gen.dart';
import 'package:fitness_app/src/features/account/logic/account_bloc.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/network/data/enum/storage/storage_folder.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/src/utils/picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class XAvatar extends StatelessWidget {
  const XAvatar({
    super.key,
    this.avatar = '',
    this.size,
    this.showEdit = false,
    this.onTap,
    this.showToast = false,
  });

  final String avatar;
  final double? size;
  final bool showEdit;
  final void Function()? onTap;
  final bool showToast;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap ??
              () {
                if (showEdit) {
                  _pickImageFromGallery(context);
                }
              },
          child: ClipOval(
            child: Image.network(
              avatar,
              width: size ?? 55,
              height: size ?? 55,
              fit: BoxFit.cover,
              loadingBuilder: (
                BuildContext context,
                Widget child,
                ImageChunkEvent? loadingProgress,
              ) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  );
                }
              },
              errorBuilder: (context, error, stackTrace) {
                if (showToast) {
                  XToast.error(S.text.avatar_loading_failed);
                }
                return Image.asset(
                  Assets.images.defaultAvatar.path,
                  width: size ?? 55,
                  height: size ?? 55,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ),
        _buildButtonCamera(context),
      ],
    );
  }

  Widget _buildButtonCamera(BuildContext context) {
    return showEdit
        ? Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                _pickImageFromCamera(context);
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.gray,
                ),
                child: const Center(
                  child: Icon(
                    Icons.camera_alt_rounded,
                    size: 20,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          )
        : const SizedBox();
  }

  Future _pickImageFromCamera(BuildContext context) async {
    final result = await PickerUtils.pickImage(
      source: ImageSource.camera,
      folder: StorageFolder.users,
    );
    if (context.mounted && result.isSuccess && result.data != null) {
      await context.read<AccountBloc>().onUpdateAvatar(result.data!);
    }
  }

  Future _pickImageFromGallery(BuildContext context) async {
    final result = await PickerUtils.pickImage(
      source: ImageSource.gallery,
      folder: StorageFolder.users,
    );

    if (context.mounted && result.isSuccess && result.data != null) {
      await context.read<AccountBloc>().onUpdateAvatar(result.data!);
    }
  }
}
