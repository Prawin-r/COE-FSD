// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDKVhhSGQXzSwumO-IQSMBKQH9DQXuUqwU',
    appId: '1:118084329103:web:a227edb5c73fa776531afa',
    messagingSenderId: '118084329103',
    projectId: 'flutterbackend-4b3ef',
    authDomain: 'flutterbackend-4b3ef.firebaseapp.com',
    storageBucket: 'flutterbackend-4b3ef.firebasestorage.app',
    measurementId: 'G-2LFV0F7WWZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDMZjROqYDkdXmU1Pzc7ptmb-0CnNCIVn8',
    appId: '1:118084329103:android:63ab9ab9ad7e7cc2531afa',
    messagingSenderId: '118084329103',
    projectId: 'flutterbackend-4b3ef',
    storageBucket: 'flutterbackend-4b3ef.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAafD3IlNHcgCcBn63LbStGrCASkOsnvcU',
    appId: '1:118084329103:ios:64ca56287721373f531afa',
    messagingSenderId: '118084329103',
    projectId: 'flutterbackend-4b3ef',
    storageBucket: 'flutterbackend-4b3ef.firebasestorage.app',
    iosBundleId: 'com.example.firebaseapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAafD3IlNHcgCcBn63LbStGrCASkOsnvcU',
    appId: '1:118084329103:ios:64ca56287721373f531afa',
    messagingSenderId: '118084329103',
    projectId: 'flutterbackend-4b3ef',
    storageBucket: 'flutterbackend-4b3ef.firebasestorage.app',
    iosBundleId: 'com.example.firebaseapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDKVhhSGQXzSwumO-IQSMBKQH9DQXuUqwU',
    appId: '1:118084329103:web:9ff08d9a92c2dea3531afa',
    messagingSenderId: '118084329103',
    projectId: 'flutterbackend-4b3ef',
    authDomain: 'flutterbackend-4b3ef.firebaseapp.com',
    storageBucket: 'flutterbackend-4b3ef.firebasestorage.app',
    measurementId: 'G-1PPNXDX67G',
  );
}
