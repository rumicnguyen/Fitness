import 'package:fitness_app/src/features/account/logic/account_bloc.dart';
import 'package:fitness_app/src/network/data/enum/storage/storage_folder.dart';
import 'package:fitness_app/src/network/data/enum/storage/storage_type.dart';
import 'package:fitness_app/src/network/data/storage/firebase_storage_reference.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/src/utils/permission_utils.dart';
import 'package:fitness_app/src/utils/picker_utils.dart';
import 'package:fitness_app/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class XAvatar extends StatefulWidget {
  const XAvatar({
    super.key,
    this.avatar,
    this.size,
    this.showEdit = false,
  });

  final String? avatar;
  final double? size;
  final bool showEdit;

  @override
  State<XAvatar> createState() => _XAvatarState();
}

class _XAvatarState extends State<XAvatar> {
  final ref = FirebaseStorageReference();
  String image = '';
  @override
  void initState() {
    super.initState();
    image = '';
    getImageUrl();
  }

  Future getImageUrl() async {
    if (widget.avatar != null) {
      final result = await ref.get(
        data: widget.avatar!,
        folder: StorageFolder.users,
      );
      if (result.isSuccess) {
        setState(() {
          image = result.data!;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            if (widget.showEdit) {
              _pickImageFromGallery(context);
            }
          },
          child: ClipOval(
            child: image.isNotEmpty
                ? Image.network(
                    image,
                    width: widget.size ?? 55,
                    height: widget.size ?? 55,
                    fit: BoxFit.cover,
                  )
                : const Loading(),
          ),
        ),
        _buildButtonCamera(context),
      ],
    );
  }

  Widget _buildButtonCamera(BuildContext context) {
    return widget.showEdit
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
}
