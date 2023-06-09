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
    apiKey: 'AIzaSyB1GYRdK9PGdFU90rFgj_Ir0D9a4hFmIDw',
    appId: '1:246810678647:web:4bcc9b5afe637b8d1a3d72',
    messagingSenderId: '246810678647',
    projectId: 'produce-1e5e8',
    authDomain: 'produce-1e5e8.firebaseapp.com',
    storageBucket: 'produce-1e5e8.appspot.com',
    measurementId: 'G-TW3GNPBEXH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDsXi-Bu9JwHIcy0YZvw8_taGj4SmFVXyI',
    appId: '1:246810678647:android:ece4066b11cc04f01a3d72',
    messagingSenderId: '246810678647',
    projectId: 'produce-1e5e8',
    storageBucket: 'produce-1e5e8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDkd8aGBFwOfMF_SArUlhfRxsu_jqDC-4w',
    appId: '1:246810678647:ios:be98e2e3c0c34ceb1a3d72',
    messagingSenderId: '246810678647',
    projectId: 'produce-1e5e8',
    storageBucket: 'produce-1e5e8.appspot.com',
    iosClientId:
        '246810678647-bcl03gato7jcl58cll1uu95gka9l270b.apps.googleusercontent.com',
    iosBundleId: 'com.example.prodeck',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDkd8aGBFwOfMF_SArUlhfRxsu_jqDC-4w',
    appId: '1:246810678647:ios:be98e2e3c0c34ceb1a3d72',
    messagingSenderId: '246810678647',
    projectId: 'produce-1e5e8',
    storageBucket: 'produce-1e5e8.appspot.com',
    iosClientId:
        '246810678647-bcl03gato7jcl58cll1uu95gka9l270b.apps.googleusercontent.com',
    iosBundleId: 'com.example.prodeck',
  );
}
