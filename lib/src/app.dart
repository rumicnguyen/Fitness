import 'package:fitness_app/gen/fonts.gen.dart';
import 'package:fitness_app/src/features/setting/logic/setting_bloc.dart';
import 'package:fitness_app/src/features/setting/logic/setting_state.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = GetIt.I<AppRouter>();
    return BlocProvider<SettingBloc>(
      create: (BuildContext context) {
        return SettingBloc();
      },
      child: BlocBuilder<SettingBloc, SettingState>(
        buildWhen: (previous, current) {
          return previous.locale != current.locale;
        },
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: FontFamily.avenir),
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
            routerConfig: appRouter.router,
          );
        },
      ),
    );
  }
}
