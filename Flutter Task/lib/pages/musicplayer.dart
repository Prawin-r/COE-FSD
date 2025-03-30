import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicPlayerPage extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String artist;
  final String previewUrl;
  final AudioPlayer audioPlayer; // Accept existing AudioPlayer instance
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  const MusicPlayerPage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.artist,
    required this.previewUrl,
    required this.audioPlayer, // Existing AudioPlayer
    required this.onNext,
    required this.onPrevious,
  });

  @override
  _MusicPlayerPageState createState() => _MusicPlayerPageState();
}

class _MusicPlayerPageState extends State<MusicPlayerPage> {
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    // Listen for audio state changes
    widget.audioPlayer.onDurationChanged.listen((d) {
      setState(() {
        duration = d;
      });
    });

    widget.audioPlayer.onPositionChanged.listen((p) {
      if (mounted && (p.inSeconds != position.inSeconds)) {
        // Only update if value changes
        setState(() {
          position = p;
        });
      }
    });


    widget.audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
        position = Duration.zero;
      });
    });

    // Check if the player is already playing
    widget.audioPlayer.getCurrentPosition().then((pos) {
      if (pos != null && pos > Duration.zero) {
        setState(() {
          isPlaying = true;
        });
      } else {
        _playSong(); // Start playing if it's a new song
      }
    });
  }

  void _playSong() async {
    await widget.audioPlayer.setSourceUrl(widget.previewUrl);
    await widget.audioPlayer.resume();
    setState(() {
      isPlaying = true;
    });
  }

  void _togglePlayPause() async {
    if (isPlaying) {
      await widget.audioPlayer.pause();
    } else {
      await widget.audioPlayer.resume();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  String _formatDuration(Duration d) {
    return "${d.inMinutes}:${(d.inSeconds % 60).toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Now Playing", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              widget.imageUrl,
              width: 250,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            widget.artist,
            style: const TextStyle(color: Colors.white70, fontSize: 18),
            textAlign: TextAlign.center,
          ),
          Slider(
            activeColor: Colors.white,
            inactiveColor: Colors.white54,
            min: 0,
            max:
                duration.inSeconds > 0
                    ? duration.inSeconds.toDouble()
                    : 1, // Avoid max = 0
            value:
                position.inSeconds > duration.inSeconds
                    ? duration.inSeconds
                        .toDouble() // Prevent exceeding duration
                    : position.inSeconds.toDouble(),
            onChanged: (value) async {
              if (duration.inSeconds > 0) {
                // Ensure duration is valid
                final newPosition = Duration(seconds: value.toInt());
                await widget.audioPlayer.seek(newPosition);
              }
            },
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatDuration(position),
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  _formatDuration(duration),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.skip_previous,
                  size: 40,
                  color: Colors.white,
                ),
                onPressed: widget.onPrevious,
              ),
              IconButton(
                icon: Icon(
                  isPlaying
                      ? Icons.pause_circle_filled
                      : Icons.play_circle_fill,
                  size: 60,
                  color: Colors.white,
                ),
                onPressed: _togglePlayPause,
              ),
              IconButton(
                icon: const Icon(
                  Icons.skip_next,
                  size: 40,
                  color: Colors.white,
                ),
                onPressed: widget.onNext,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
