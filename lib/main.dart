import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/firebase_options/firebase_options.dart';
import 'package:fitness_app/src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dot_env;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  await dot_env.dotenv.load(
    fileName: "assets/.env",
  );

  runApp(const MyApp());
}
