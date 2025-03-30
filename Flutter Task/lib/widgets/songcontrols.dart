import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SongControls extends StatefulWidget {
  final AudioPlayer audioPlayer;
  final String previewUrl;
  final VoidCallback onPlay;
  final VoidCallback onStop;

  const SongControls({super.key, 
    required this.audioPlayer,
    required this.previewUrl,
    required this.onPlay, // Callback for when playback starts
    required this.onStop, // Callback for when playback stops
  });

  @override
  _SongControlsState createState() => _SongControlsState();
}

class _SongControlsState extends State<SongControls> {
  bool isPlaying = false;

  void _togglePlay() async {
    if (isPlaying) {
      await widget.audioPlayer.pause();
      widget.onStop(); // Notify HomePage that playback has stopped
    } else {
      await widget.audioPlayer.play(UrlSource(widget.previewUrl));
      widget.onPlay(); // Notify HomePage that playback has started
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
          onPressed: _togglePlay,
        ),
      ],
    );
  }
}
