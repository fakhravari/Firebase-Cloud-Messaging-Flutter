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
    apiKey: 'AIzaSyBTg_BCKGPE_1O-gvP4B0iyrHWL17tu_PE',
    appId: '1:870635139547:web:4c18a513418503b6ddb7fe',
    messagingSenderId: '870635139547',
    projectId: 'pushtest-c61f0',
    authDomain: 'pushtest-c61f0.firebaseapp.com',
    storageBucket: 'pushtest-c61f0.appspot.com',
    measurementId: 'G-8C30CPBV8Z',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAjFdbqrGZ7tpOgx6AhKhA5gg2o_m4KfCw',
    appId: '1:870635139547:android:c2c514e658852e3cddb7fe',
    messagingSenderId: '870635139547',
    projectId: 'pushtest-c61f0',
    storageBucket: 'pushtest-c61f0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB1qbC3pioR5ZVBXeTXxMJNmePMtHn8Bkw',
    appId: '1:870635139547:ios:74d4d776f6bc56a9ddb7fe',
    messagingSenderId: '870635139547',
    projectId: 'pushtest-c61f0',
    storageBucket: 'pushtest-c61f0.appspot.com',
    iosClientId: '870635139547-ugpr4drhfsorrlqoeks8ekht4q884hu9.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB1qbC3pioR5ZVBXeTXxMJNmePMtHn8Bkw',
    appId: '1:870635139547:ios:cefa448e031457faddb7fe',
    messagingSenderId: '870635139547',
    projectId: 'pushtest-c61f0',
    storageBucket: 'pushtest-c61f0.appspot.com',
    iosClientId: '870635139547-8q46e3m1runf1mvr7q6mnv85c7git5ll.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1.RunnerTests',
  );
}