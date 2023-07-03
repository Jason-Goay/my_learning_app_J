import 'dart:developer';

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
      apiKey: "AIzaSyAqch9bbSLr4py5waDdClhqNcdkMg5MEBo",
      authDomain: "e-commerce-f07e4.firebaseapp.com",
      projectId: "e-commerce-f07e4",
      storageBucket: "e-commerce-f07e4.appspot.com",
      messagingSenderId: "35867764436",
      appId: "1:35867764436:web:c22bbf57375e75b80f3d41",
      measurementId: "G-S8MJZJZ42S");

  static const FirebaseOptions android = FirebaseOptions(
      apiKey: "AIzaSyDU0hTnl6NJRdXcH5vKrh2cxy01mQkehS8",
      projectId: "e-commerce-f07e4",
      storageBucket: "e-commerce-f07e4.appspot.com",
      messagingSenderId: "35867764436",
      appId: "1:35867764436:web:c22bbf57375e75b80f3d41",
      androidClientId:
          '35867764436-n8qopc5ige6l7eajgshaev7jec9k11ke.apps.googleusercontent.com');

  static const FirebaseOptions ios = FirebaseOptions(
      apiKey: "AIzaSyCbYQXzVKmySOfzBv7Ma05TuyVL2uTlOtg",
      projectId: "e-commerce-f07e4",
      storageBucket: "e-commerce-f07e4.appspot.com",
      messagingSenderId: "35867764436",
      appId: "1:35867764436:web:c22bbf57375e75b80f3d41",
      iosClientId:
          '35867764436-csof6v7n9o6iqmh37but4cm2o0ndh7t4.apps.googleusercontent.com',
      iosBundleId: 'com.example.myLearningApp',
      androidClientId:
          '35867764436-n8qopc5ige6l7eajgshaev7jec9k11ke.apps.googleusercontent.com');
}
