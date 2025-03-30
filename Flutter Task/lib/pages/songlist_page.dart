import 'package:firebaseapp/pages/musicplayer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'favorites_manager.dart';

class SongListPage extends StatefulWidget {
  const SongListPage({super.key, required Null Function(String previewUrl, String title, String artist, String image) onSongSelected});

  @override
  _SongListPageState createState() => _SongListPageState();
}

class _SongListPageState extends State<SongListPage> {
  List<dynamic> songs = [];
  final AudioPlayer _audioPlayer = AudioPlayer();
  String? currentlyPlayingUrl;
  String? currentlyPlayingTitle;
  String? currentlyPlayingArtist;
  String? currentlyPlayingImage;
  int currentIndex = -1;

  @override
  void initState() {
    super.initState();
    fetchSongs();
  }

  Future<void> fetchSongs() async {
    final url = Uri.parse(
      'https://itunes.apple.com/search?term=pop&entity=musicTrack&limit=50',
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        setState(() {
          songs = data['results'];
        });
      }
    } catch (e) {
      print("Error fetching songs: $e");
    }
  }

 void _playSong(int index) async {
    if (index < 0 || index >= songs.length) return;
    var song = songs[index];
    String? previewUrl = song['previewUrl'];
    if (previewUrl == null) return;

    await _audioPlayer.play(UrlSource(previewUrl));

    setState(() {
      currentIndex = index;
      currentlyPlayingUrl = previewUrl;
      currentlyPlayingTitle = song['trackName'];
      currentlyPlayingArtist = song['artistName'];
      currentlyPlayingImage = song['artworkUrl100'];
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => MusicPlayerPage(
              previewUrl: currentlyPlayingUrl!,
              title: currentlyPlayingTitle ?? "Unknown",
              artist: currentlyPlayingArtist ?? "Unknown",
              imageUrl: currentlyPlayingImage ?? "",
              audioPlayer: _audioPlayer, // Pass the existing audio player
              onNext: _playNextSong,
              onPrevious: _playPreviousSong,
            ),
      ),
    );
  }


  void _playNextSong() {
    if (currentIndex < songs.length - 1) {
      _playSong(currentIndex + 1);
    }
  }

  void _playPreviousSong() {
    if (currentIndex > 0) {
      _playSong(currentIndex - 1);
    }
  }

  void _addToFavorites(String title, String artist, String imageUrl) {
    final songData = {'title': title, 'artist': artist, 'imageUrl': imageUrl};
    FavoritesManager().addFavorite(songData);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Added to Favorites!")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text("Songs"), backgroundColor: Colors.black),
      body: Column(
        children: [
          if (currentlyPlayingUrl != null)
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      currentlyPlayingImage!,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentlyPlayingTitle!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          currentlyPlayingArtist!,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      _audioPlayer.state == PlayerState.playing
                          ? Icons.pause_circle_filled
                          : Icons.play_circle_fill,
                      color: Colors.green,
                      size: 35,
                    ),
                    onPressed: () => _playSong(currentIndex),
                  ),
                ],
              ),
            ),
          Expanded(
            child:
                songs.isEmpty
                    ? const Center(
                      child: CircularProgressIndicator(color: Colors.green),
                    )
                    : ListView.builder(
                      itemCount: songs.length,
                      itemBuilder: (context, index) {
                        var song = songs[index];
                        return ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              song['artworkUrl100'],
                              width: 50,
                            ),
                          ),
                          title: Text(
                            song['trackName'],
                            style: const TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            song['artistName'],
                            style: const TextStyle(color: Colors.grey),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(
                                  currentlyPlayingUrl == song['previewUrl']
                                      ? Icons.pause_circle_filled
                                      : Icons.play_circle_fill,
                                  color: Colors.green,
                                  size: 35,
                                ),
                                onPressed: () => _playSong(index),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                                onPressed:
                                    () => _addToFavorites(
                                      song['trackName'] ?? "Unknown Track",
                                      song['artistName'] ?? "Unknown Artist",
                                      song['artworkUrl100'] ?? "",
                                    ),
                              ),
                            ],
                          ),
                          onTap: () => _playSong(index),
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}
