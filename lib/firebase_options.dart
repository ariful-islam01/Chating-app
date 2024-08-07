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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCLU1HBYMdQcDR-WsIC7w4dWD6C-_0DWAU',
    appId: '1:572549755107:android:ab389ecdf2566dc2b9d5d6',
    messagingSenderId: '572549755107',
    projectId: 'chatingapp-42fb4',
    storageBucket: 'chatingapp-42fb4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDvnv5mgUOiPRhp1oLJ3dlvsRNyKITFC04',
    appId: '1:572549755107:ios:f9c34ea015110458b9d5d6',
    messagingSenderId: '572549755107',
    projectId: 'chatingapp-42fb4',
    storageBucket: 'chatingapp-42fb4.appspot.com',
    androidClientId: '572549755107-piisjcegbfi3v45vm3iqireca48612rt.apps.googleusercontent.com',
    iosClientId: '572549755107-82gsuj4nqec4rc59q6espqs3ldtcj644.apps.googleusercontent.com',
    iosBundleId: 'com.example.chtingApp',
  );

}