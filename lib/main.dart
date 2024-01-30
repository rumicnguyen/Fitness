import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:fitness_app/firebase_options.dart';
import 'package:fitness_app/src/app.dart';
import 'package:fitness_app/src/locator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future main() async {
  await initializeApp(
      name: "production",
      firebaseOptions: DefaultFirebaseOptions.currentPlatform);
  if (kIsWeb) {
    runApp(const MyApp());
  } else {
    // FlutterError.onError = (errorDetails) {
    //   FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    // };
    
    // PlatformDispatcher.instance.onError = (error, stack) {
    //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    //   return true;
    // };
    runApp(const MyApp());
  }
}
