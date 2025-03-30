import 'package:flutter/material.dart';
import 'package:firebaseapp/l10n/app_localizations.dart';
import 'package:audioplayers/audioplayers.dart';
import '../widgets/songcontrols.dart';
import 'songlist_page.dart';
import 'favorites_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  int _selectedIndex = 0;
  bool _isPlaying = false; // Track if a song is playing

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 17, 17), // Dark background
      body: Stack(
        children: [
          // Background Image with Transparency
          Opacity(
            opacity: 0.2, // Low transparency
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/bg.jpeg"), // Background image
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          IndexedStack(
            index: _selectedIndex,
            children: [
              // ✅ Home Screen with Welcome Message & Browse Songs Button
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      localization.app_title, // Localized app title
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed:
                          () => _onItemTapped(1), // Navigate to SongListPage
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // White button
                        foregroundColor: Colors.blue[900], // Dark blue text
                      ),
                      child: Text(localization.play_songs), // Localized text
                    ),
                  ],
                ),
              ),
              SongListPage(
                onSongSelected:
                    (
                      String previewUrl,
                      String title,
                      String artist,
                      String image,
                    ) {},
              ),
              const FavoritesPage(),
              ProfilePage(),
            ],
          ),

          // Mini Player (ONLY show when a song is playing)
          if (_isPlaying)
            Positioned(
              bottom: 65, // Above bottom navigation bar
              left: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue[800], // Dark Blue theme
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: SongControls(
                  audioPlayer: _audioPlayer,
                  previewUrl: 'https://sample-videos.com/audio/mp3/wave.mp3',
                  onPlay: () {
                    setState(() {
                      _isPlaying = true; // Show mini-player
                    });
                  },
                  onStop: () {
                    setState(() {
                      _isPlaying = false; // Hide mini-player when stopped
                    });
                  },
                ),
              ),
            ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0), // Dark Blue Navbar
        selectedItemColor: Colors.white, // White selected icon
        unselectedItemColor: Colors.white70, // Light white unselected icon
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: localization.home, // Localized text
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.library_music),
            label: localization.songs, // Localized text
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite),
            label: localization.favorites, // Localized text
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: localization.profile, // Localized text
          ),
        ],
      ),
    );
  }
}
