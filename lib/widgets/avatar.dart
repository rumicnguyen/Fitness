import 'package:fitness_app/gen/assets.gen.dart';
import 'package:fitness_app/src/network/data/enum/storage/storage_folder.dart';
import 'package:fitness_app/src/network/data/storage/firebase_storage_reference.dart';
import 'package:flutter/material.dart';

class XAvatar extends StatefulWidget {
  const XAvatar({
    super.key,
    this.avatar,
    this.size,
  });

  final String? avatar;
  final double? size;

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
    return ClipOval(
      child: image.isNotEmpty
          ? Image.network(
              image,
              width: widget.size ?? 55,
              height: widget.size ?? 55,
              fit: BoxFit.cover,
            )
          : Image.asset(
              Assets.images.user.path,
              width: widget.size ?? 55,
              height: widget.size ?? 55,
              fit: BoxFit.cover,
            ),
    );
  }
}
