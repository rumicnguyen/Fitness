/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/avatar.jpg
  AssetGenImage get avatar => const AssetGenImage('assets/images/avatar.jpg');

  /// File path: assets/images/coming_soon.png
  AssetGenImage get comingSoon =>
      const AssetGenImage('assets/images/coming_soon.png');

  /// File path: assets/images/eng.png
  AssetGenImage get eng => const AssetGenImage('assets/images/eng.png');

  /// File path: assets/images/intro.png
  AssetGenImage get intro => const AssetGenImage('assets/images/intro.png');

  /// File path: assets/images/item_1.png
  AssetGenImage get item1 => const AssetGenImage('assets/images/item_1.png');

  /// File path: assets/images/item_10.jpg
  AssetGenImage get item10 => const AssetGenImage('assets/images/item_10.jpg');

  /// File path: assets/images/item_2.png
  AssetGenImage get item2 => const AssetGenImage('assets/images/item_2.png');

  /// File path: assets/images/item_3.png
  AssetGenImage get item3 => const AssetGenImage('assets/images/item_3.png');

  /// File path: assets/images/item_4.jpg
  AssetGenImage get item4 => const AssetGenImage('assets/images/item_4.jpg');

  /// File path: assets/images/item_5.png
  AssetGenImage get item5 => const AssetGenImage('assets/images/item_5.png');

  /// File path: assets/images/item_6.jpg
  AssetGenImage get item6 => const AssetGenImage('assets/images/item_6.jpg');

  /// File path: assets/images/item_7.png
  AssetGenImage get item7 => const AssetGenImage('assets/images/item_7.png');

  /// File path: assets/images/item_8.jpg
  AssetGenImage get item8 => const AssetGenImage('assets/images/item_8.jpg');

  /// File path: assets/images/item_9.png
  AssetGenImage get item9 => const AssetGenImage('assets/images/item_9.png');

  /// File path: assets/images/new_background.jpg
  AssetGenImage get newBackground =>
      const AssetGenImage('assets/images/new_background.jpg');

  /// File path: assets/images/new_transparent.png
  AssetGenImage get newTransparent =>
      const AssetGenImage('assets/images/new_transparent.png');

  /// File path: assets/images/user.png
  AssetGenImage get user => const AssetGenImage('assets/images/user.png');

  /// File path: assets/images/vie.png
  AssetGenImage get vie => const AssetGenImage('assets/images/vie.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        avatar,
        comingSoon,
        eng,
        intro,
        item1,
        item10,
        item2,
        item3,
        item4,
        item5,
        item6,
        item7,
        item8,
        item9,
        newBackground,
        newTransparent,
        user,
        vie
      ];
}

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  /// File path: assets/svgs/ic_google.svg
  String get icGoogle => 'assets/svgs/ic_google.svg';

  /// List of all assets
  List<String> get values => [icGoogle];
}

class Assets {
  Assets._();

  static const String env = 'assets/.env';
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();

  /// List of all assets
  static List<String> get values => [env];
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
