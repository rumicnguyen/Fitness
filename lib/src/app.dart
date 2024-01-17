import 'package:fitness_app/src/features/setting/logic/setting_bloc.dart';
import 'package:fitness_app/src/features/setting/logic/setting_state.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/router/router.dart';
import 'package:fitness_app/src/services/user_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingBloc>(
      create: (BuildContext context) {
        return SettingBloc();
      },
      child: BlocBuilder<SettingBloc, SettingState>(
        buildWhen: (previous, current) {
          return previous.locale != current.locale;
        },
        builder: (context, state) {
          UserPrefs.instance.initialize();
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'),
              Locale('vi'),
            ],
            locale: state.locale,
            routerConfig: AppRouter().router,
          );
        },
      ),
    );
  }
}
