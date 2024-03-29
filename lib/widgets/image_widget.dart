import 'package:fitness_app/gen/assets.gen.dart';
import 'package:fitness_app/src/network/data/enum/storage/storage_folder.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return borderRadius != null
        ? ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius ?? 30),
            child: _buildBody(),
          )
        : _buildBody();
  }

  Widget _buildBody() {
    return Image.network(
      image,
      fit: fit,
      alignment: alignment,
      width: width,
      height: height,
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
        return Image.asset(
          Assets.images.blankImage.path,
          width: width,
          height: height,
          fit: BoxFit.cover,
        );
      },
    );
  }
}
