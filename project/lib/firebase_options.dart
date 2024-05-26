import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  // Get the Firebase options based on the current platform
  static FirebaseOptions get currentPlatform {
    // If the platform is web, return web options
    if (kIsWeb) {
      return web;
    }
    // For other platforms, switch based on defaultTargetPlatform
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macOS - '
              'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for Linux - '
              'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  // Firebase options for web platform
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA7kWcwjnt-WKnBnSRSgKKqfONLz947sCQ',
    appId: '1:657458249432:web:c760f0f5b47808ec8661ad',
    messagingSenderId: '657458249432',
    projectId: 'smarthome-3a1d9',
    authDomain: 'smarthome-3a1d9.firebaseapp.com',
    storageBucket: 'smarthome-3a1d9.appspot.com',
  );

  // Firebase options for Android platform
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBUgkrRCoJHudkxexCh1JMRjWlDlYcSGxE',
    appId: '1:657458249432:android:80ac92aea57c1c2d8661ad',
    messagingSenderId: '657458249432',
    projectId: 'smarthome-3a1d9',
    storageBucket: 'smarthome-3a1d9.appspot.com',
  );

  // Firebase options for iOS platform
  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAuOkFfZHdtGis_2lUWsS5g77a_C-S0gzA',
    appId: '1:657458249432:ios:8b8c85ddfea069cf8661ad',
    messagingSenderId: '657458249432',
    projectId: 'smarthome-3a1d9',
    storageBucket: 'smarthome-3a1d9.appspot.com',
    iosBundleId: 'com.example.project',
  );

  // Firebase options for Windows platform
  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyASnpYDsG4y83bwFvDZHScHPg2TjLrUfTM',
    appId: '1:114542879236:web:e40a141dc8f9901a880b51',
    messagingSenderId: '114542879236',
    projectId: 'blinkawy-fac41',
    authDomain: 'blinkawy-fac41.firebaseapp.com',
    storageBucket: 'blinkawy-fac41.appspot.com',
  );
}
