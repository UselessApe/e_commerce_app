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
    apiKey: 'AIzaSyAqbvELoqnPsvoEoqa7TAsbVu3eomOflws',
    appId: '1:725337253903:web:fa205d878496150bd55b7a',
    messagingSenderId: '725337253903',
    projectId: 'useless-ape-e-commerce-app',
    authDomain: 'useless-ape-e-commerce-app.firebaseapp.com',
    storageBucket: 'useless-ape-e-commerce-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAwfjUKdBmEfxwCszkNOWk65bjtGYlrG7M',
    appId: '1:725337253903:android:ca997d4257ae83c8d55b7a',
    messagingSenderId: '725337253903',
    projectId: 'useless-ape-e-commerce-app',
    storageBucket: 'useless-ape-e-commerce-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAjNIw-o2HwXpNU7Dtlo6Fw61bg7toajiQ',
    appId: '1:725337253903:ios:9d242ddefd85b45dd55b7a',
    messagingSenderId: '725337253903',
    projectId: 'useless-ape-e-commerce-app',
    storageBucket: 'useless-ape-e-commerce-app.appspot.com',
    iosClientId: '725337253903-o3jd04k5tno56gecr16822jab7a51bnl.apps.googleusercontent.com',
    iosBundleId: 'com.example.eCommerceApp',
  );
}
