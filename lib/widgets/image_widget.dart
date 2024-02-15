import 'package:fitness_app/src/network/data/enum/storage/storage_folder.dart';
import 'package:fitness_app/src/network/data/storage/firebase_storage_reference.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatefulWidget {
  const ImageWidget({
    super.key,
    this.folder = StorageFolder.workouts,
    required this.image,
    this.fit = BoxFit.fill,
    this.width = 30.0,
    this.height = 30.0,
    this.alignment = Alignment.center,
    this.borderRadius,
  });

  final StorageFolder folder;
  final String image;
  final BoxFit fit;
  final double width;
  final double height;
  final Alignment alignment;
  final double? borderRadius;

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  String url = '';
  Future syncData() async {
    FirebaseStorageReference ref = FirebaseStorageReference();
    final result = await ref.get(
      folder: widget.folder,
      data: widget.image,
    );
    if (result.isSuccess && result.data != null) {
      setState(() {
        url = result.data!;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    url = '';
    syncData();
  }

  @override
  Widget build(BuildContext context) {
    return widget.borderRadius != null
        ? ClipRRect(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 30),
            child: _buildBody(),
          )
        : _buildBody();
  }

  Widget _buildBody() {
    return Image.network(
      url,
      fit: widget.fit,
      alignment: widget.alignment,
      width: widget.width,
      height: widget.height,
    );
  }
}
