import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeVideoPlayer extends StatelessWidget {
  final String videoUrl;

  YouTubeVideoPlayer({required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoUrl)!,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        isLive: false,
      ),
    );

    return SizedBox(
      width: 280,
      height: 180,
      child: YoutubePlayer(
        width: 280,
        controller: _controller,
      ),
    );
  }
}
