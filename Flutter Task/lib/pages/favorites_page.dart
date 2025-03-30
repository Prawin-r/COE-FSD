import 'package:flutter/material.dart';
import 'favorites_manager.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final FavoritesManager _favoritesManager = FavoritesManager();

  @override
  void initState() {
    super.initState();
    _favoritesManager.addListener(_updateFavorites);
    _favoritesManager.loadFavorites(); // Ensure latest data is fetched
  }

  @override
  void dispose() {
    _favoritesManager.removeListener(_updateFavorites);
    super.dispose();
  }

  void _updateFavorites() {
    setState(() {}); // Refresh when favorites change
  }

  @override
  Widget build(BuildContext context) {
    final favoriteSongs = _favoritesManager.favoriteSongs;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Favorites"), backgroundColor: Colors.black),
      body:
          favoriteSongs.isEmpty
              ? Center(
                child: Text(
                  "No favorites yet!",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )
              : ListView.builder(
                itemCount: favoriteSongs.length,
                itemBuilder: (context, index) {
                  var song = favoriteSongs[index];
                  return ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(song['imageUrl'], width: 50),
                    ),
                    title: Text(
                      song['title'],
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      song['artist'],
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed:
                          () => _favoritesManager.removeFavorite(song['title']),
                    ),
                  );
                },
              ),
    );
  }
}
