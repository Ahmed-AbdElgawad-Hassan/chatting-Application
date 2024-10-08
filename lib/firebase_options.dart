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
    apiKey: 'AIzaSyAwLuucLky_CjuRK5dx7hQ-mFoXJTbTG2M',
    appId: '1:864418423064:web:497bc7db7845dc9d223e6d',
    messagingSenderId: '864418423064',
    projectId: 'chat-application-7832e',
    authDomain: 'chat-application-7832e.firebaseapp.com',
    storageBucket: 'chat-application-7832e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBbC_GC3QxKylKNZ1PgPLejIThGXiO_8aQ',
    appId: '1:864418423064:android:2c03df43fdeed362223e6d',
    messagingSenderId: '864418423064',
    projectId: 'chat-application-7832e',
    storageBucket: 'chat-application-7832e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCIgW1nMV3J8TY-TQ2V9JSORFySAXdzB8c',
    appId: '1:864418423064:ios:2c71cbe403dc515c223e6d',
    messagingSenderId: '864418423064',
    projectId: 'chat-application-7832e',
    storageBucket: 'chat-application-7832e.appspot.com',
    iosBundleId: 'com.example.chat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCIgW1nMV3J8TY-TQ2V9JSORFySAXdzB8c',
    appId: '1:864418423064:ios:2c71cbe403dc515c223e6d',
    messagingSenderId: '864418423064',
    projectId: 'chat-application-7832e',
    storageBucket: 'chat-application-7832e.appspot.com',
    iosBundleId: 'com.example.chat',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAwLuucLky_CjuRK5dx7hQ-mFoXJTbTG2M',
    appId: '1:864418423064:web:5a6227de203441cb223e6d',
    messagingSenderId: '864418423064',
    projectId: 'chat-application-7832e',
    authDomain: 'chat-application-7832e.firebaseapp.com',
    storageBucket: 'chat-application-7832e.appspot.com',
  );
}
