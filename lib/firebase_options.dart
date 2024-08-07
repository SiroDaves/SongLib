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
    apiKey: 'AIzaSyAizoQ-WrQycolmwch-OWAqO9WiTiss42k',
    appId: '1:1086992574189:web:803cacec01c0cda338cee4',
    messagingSenderId: '1086992574189',
    projectId: 'thesonglib',
    authDomain: 'thesonglib.firebaseapp.com',
    storageBucket: 'thesonglib.appspot.com',
    measurementId: 'G-42XBLTNS8B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCwK-GqTSAI5jSJ3niRe3jX-tyjd_iwN_w',
    appId: '1:1086992574189:android:6dadf48acae4f39738cee4',
    messagingSenderId: '1086992574189',
    projectId: 'thesonglib',
    storageBucket: 'thesonglib.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC3mXB55MxmPssH5Tlf4X8R-LGI5drCtKw',
    appId: '1:1086992574189:ios:fcda8ca8c937ed6038cee4',
    messagingSenderId: '1086992574189',
    projectId: 'thesonglib',
    storageBucket: 'thesonglib.appspot.com',
    iosClientId: '1086992574189-h8n2i0ti8e25vqrsrhiage3qv7bb4fqh.apps.googleusercontent.com',
    iosBundleId: 'com.songlib',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC3mXB55MxmPssH5Tlf4X8R-LGI5drCtKw',
    appId: '1:1086992574189:ios:fcda8ca8c937ed6038cee4',
    messagingSenderId: '1086992574189',
    projectId: 'thesonglib',
    storageBucket: 'thesonglib.appspot.com',
    iosClientId: '1086992574189-h8n2i0ti8e25vqrsrhiage3qv7bb4fqh.apps.googleusercontent.com',
    iosBundleId: 'com.songlib',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAizoQ-WrQycolmwch-OWAqO9WiTiss42k',
    appId: '1:1086992574189:web:9778f08c056259c938cee4',
    messagingSenderId: '1086992574189',
    projectId: 'thesonglib',
    authDomain: 'thesonglib.firebaseapp.com',
    storageBucket: 'thesonglib.appspot.com',
    measurementId: 'G-5V34QXZHBK',
  );
}
