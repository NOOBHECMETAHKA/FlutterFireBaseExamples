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
    apiKey: 'AIzaSyC-vSTdV_wY3XitKj6tD1HmvGuiTkqGdxY',
    appId: '1:260035280161:web:3ac827aff5c39405821260',
    messagingSenderId: '260035280161',
    projectId: 'fluttertest-e7c3c',
    authDomain: 'fluttertest-e7c3c.firebaseapp.com',
    storageBucket: 'fluttertest-e7c3c.appspot.com',
    measurementId: 'G-KL6ZVJJ91V',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAaLyrcYnIDzxUd7WNVJjR7GZZJ_nKyrnI',
    appId: '1:260035280161:android:3f3a93890ef01fbc821260',
    messagingSenderId: '260035280161',
    projectId: 'fluttertest-e7c3c',
    storageBucket: 'fluttertest-e7c3c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAI6Zh-XSzVs8R8suOKsAu-4rOeC_mEL00',
    appId: '1:260035280161:ios:d998ee1e22dba6e2821260',
    messagingSenderId: '260035280161',
    projectId: 'fluttertest-e7c3c',
    storageBucket: 'fluttertest-e7c3c.appspot.com',
    iosBundleId: 'com.example.learnFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAI6Zh-XSzVs8R8suOKsAu-4rOeC_mEL00',
    appId: '1:260035280161:ios:6153533048249989821260',
    messagingSenderId: '260035280161',
    projectId: 'fluttertest-e7c3c',
    storageBucket: 'fluttertest-e7c3c.appspot.com',
    iosBundleId: 'com.example.learnFirebase.RunnerTests',
  );
}