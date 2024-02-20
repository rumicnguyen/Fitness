import 'package:fitness_app/src/features/intro/logic/intro_state.dart';
import 'package:fitness_app/src/services/user_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IntroBloc extends Cubit<IntroState> {
  IntroBloc() : super(IntroState.ds());

  void onChangeLocalizations(Locale? locale) {
    if (locale != null) {
      emit(state.copyWith(locale: locale));
      UserPrefs.instance.setLocale(locale);
    }
  }
}
