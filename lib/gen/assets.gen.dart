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

  /// File path: assets/images/blank_image.jpg
  AssetGenImage get blankImage =>
      const AssetGenImage('assets/images/blank_image.jpg');

  /// File path: assets/images/coming_soon.png
  AssetGenImage get comingSoon =>
      const AssetGenImage('assets/images/coming_soon.png');

  /// File path: assets/images/default_avatar.jpg
  AssetGenImage get defaultAvatar =>
      const AssetGenImage('assets/images/default_avatar.jpg');

  /// File path: assets/images/eng.png
  AssetGenImage get eng => const AssetGenImage('assets/images/eng.png');

  /// File path: assets/images/intro.png
  AssetGenImage get intro => const AssetGenImage('assets/images/intro.png');

  /// File path: assets/images/pulse.png
  AssetGenImage get pulse => const AssetGenImage('assets/images/pulse.png');

  /// File path: assets/images/vie.png
  AssetGenImage get vie => const AssetGenImage('assets/images/vie.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [blankImage, comingSoon, defaultAvatar, eng, intro, pulse, vie];
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
