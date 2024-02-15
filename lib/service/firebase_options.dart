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
    apiKey: 'AIzaSyDw1ori_kX2Vnvu9ttjyMt6sUew-qMLeIA',
    appId: '1:941291144002:web:a933a0aebc14dfc63cbedb',
    messagingSenderId: '941291144002',
    projectId: 'book-af8cb',
    authDomain: 'book-af8cb.firebaseapp.com',
    storageBucket: 'book-af8cb.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCO0gQW5M1Pvj3xjtYShpEuws4ZwOCw5nI',
    appId: '1:941291144002:android:72437cbe2b68c4de3cbedb',
    messagingSenderId: '941291144002',
    projectId: 'book-af8cb',
    storageBucket: 'book-af8cb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC87cjNcbjyjFW98cRHMB7WHcHcKCNAfmQ',
    appId: '1:941291144002:ios:bfbe83dfbdb7d11f3cbedb',
    messagingSenderId: '941291144002',
    projectId: 'book-af8cb',
    storageBucket: 'book-af8cb.appspot.com',
    androidClientId: '941291144002-mrrddhto25a495b6jip1l8uu8qcfv4nh.apps.googleusercontent.com',
    iosClientId: '941291144002-thokl5vbvn03u6r0akjp6a7ffk2d92qi.apps.googleusercontent.com',
    iosBundleId: 'com.example.authentication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC87cjNcbjyjFW98cRHMB7WHcHcKCNAfmQ',
    appId: '1:941291144002:ios:f582f2965268d0ca3cbedb',
    messagingSenderId: '941291144002',
    projectId: 'book-af8cb',
    storageBucket: 'book-af8cb.appspot.com',
    androidClientId: '941291144002-mrrddhto25a495b6jip1l8uu8qcfv4nh.apps.googleusercontent.com',
    iosClientId: '941291144002-sm8lmba2brgn0f322fvn5amjdpl3vkfk.apps.googleusercontent.com',
    iosBundleId: 'com.example.authentication.RunnerTests',
  );
}
