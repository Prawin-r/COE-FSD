import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FavoritesManager extends ChangeNotifier {
  static final FavoritesManager _instance = FavoritesManager._internal();

  factory FavoritesManager() {
    return _instance;
  }

  FavoritesManager._internal(); // Removed _loadFavorites() call from here

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get userId =>
      _auth.currentUser?.uid ?? "guest_user"; // Fallback for guests

  List<Map<String, dynamic>> _favoriteSongs = [];

  List<Map<String, dynamic>> get favoriteSongs => _favoriteSongs;

  /// Initialize function to be called in the app after instantiation
  Future<void> initialize() async {
    await loadFavorites();
  }

  /// Load user's favorite songs from Firestore
  Future<void> loadFavorites() async {
    if (_auth.currentUser == null) return; // Ensure user is logged in

    try {
      var snapshot =
          await _firestore
              .collection('users')
              .doc(userId)
              .collection('favorites')
              .get();

      _favoriteSongs = snapshot.docs.map((doc) => doc.data()).toList();
      notifyListeners();
    } catch (e) {
      print("Error loading favorites: $e");
    }
  }

  /// Add a song to favorites
  Future<void> addFavorite(Map<String, dynamic> song) async {
    if (_auth.currentUser == null) return;

    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('favorites')
          .doc(song['title']) // Use song title as the document ID
          .set(song);

      _favoriteSongs.add(song);
      notifyListeners();
    } catch (e) {
      print("Error adding favorite: $e");
    }
  }

  /// Remove a song from favorites
  Future<void> removeFavorite(String title) async {
    if (_auth.currentUser == null) return;

    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('favorites')
          .doc(title)
          .delete();

      _favoriteSongs.removeWhere((song) => song['title'] == title);
      notifyListeners();
    } catch (e) {
      print("Error removing favorite: $e");
    }
  }
}
