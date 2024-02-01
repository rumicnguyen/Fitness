import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/src/features/account/logic/account_bloc.dart';
import 'package:fitness_app/src/network/domain_manager.dart';
import 'package:fitness_app/src/router/router.dart';
import 'package:fitness_app/src/services/user_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dot_env;

Future initializeApp({String? name, FirebaseOptions? firebaseOptions}) async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  _locator();
  await Firebase.initializeApp(name: name, options: firebaseOptions);
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
  );
  await Future.wait([
    UserPrefs.instance.initialize(),
    dot_env.dotenv.load(
      fileName: "assets/.env",
    ),
  ]);
}

void _locator() {
  GetIt.I.registerLazySingleton(() => DomainManager());
  GetIt.I.registerLazySingleton(() => AppRouter());
  GetIt.I.registerLazySingleton(() => AccountBloc());
}
