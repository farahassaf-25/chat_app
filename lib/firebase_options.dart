// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCRkBfQHlfh6kCSMbDPuGnq1Cfp3VErphc',
    appId: '1:685676350983:web:7df5fb587af50a32eda4a2',
    messagingSenderId: '685676350983',
    projectId: 'chat-app-92187',
    authDomain: 'chat-app-92187.firebaseapp.com',
    storageBucket: 'chat-app-92187.appspot.com',
    measurementId: 'G-1K2G2RHEZD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD7C19rO7-UDHTz5xOKKmmV_wSYQgEwDiQ',
    appId: '1:685676350983:android:1b91595665ef46e4eda4a2',
    messagingSenderId: '685676350983',
    projectId: 'chat-app-92187',
    storageBucket: 'chat-app-92187.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAzDdvJN-UZ5mgD_OILy1lp1oE1ogmbigY',
    appId: '1:685676350983:ios:b75b272564772d11eda4a2',
    messagingSenderId: '685676350983',
    projectId: 'chat-app-92187',
    storageBucket: 'chat-app-92187.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAzDdvJN-UZ5mgD_OILy1lp1oE1ogmbigY',
    appId: '1:685676350983:ios:d6c517dc3d3fa9c3eda4a2',
    messagingSenderId: '685676350983',
    projectId: 'chat-app-92187',
    storageBucket: 'chat-app-92187.appspot.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}
