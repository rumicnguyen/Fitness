import 'package:bot_toast/bot_toast.dart';
import 'package:fitness_app/gen/fonts.gen.dart';
import 'package:fitness_app/src/features/account/logic/account_bloc.dart';
import 'package:fitness_app/src/features/intro/logic/intro_bloc.dart';
import 'package:fitness_app/src/features/intro/logic/intro_state.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/router/router.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: AppColors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    final appRouter = GetIt.I<AppRouter>();
    return BlocProvider<IntroBloc>(
      create: (BuildContext context) {
        return IntroBloc();
      },
      child: BlocBuilder<IntroBloc, IntroState>(
        buildWhen: (previous, current) {
          return previous.locale != current.locale;
        },
        builder: (context, state) {
          return BlocProvider<AccountBloc>(
            create: (context) => AccountBloc(),
            child: MaterialApp.router(
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
              builder: BotToastInit(),
              routerConfig: appRouter.router,
            ),
          );
        },
      ),
    );
  }
}
