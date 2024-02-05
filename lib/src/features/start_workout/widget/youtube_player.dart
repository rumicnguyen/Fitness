import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class XYoutubePlayer extends StatelessWidget {
  const XYoutubePlayer({
    super.key,
    required this.controller,
  });

  final YoutubePlayerController controller;

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: controller,
      showVideoProgressIndicator: true,
    );
  }
}
