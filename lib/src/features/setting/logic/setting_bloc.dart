import 'package:fitness_app/src/features/setting/logic/setting_state.dart';
import 'package:fitness_app/src/services/user_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingBloc extends Cubit<SettingState> {
  SettingBloc() : super(SettingState.ds());

  void onChangeLocalizations(Locale? locale) {
    if (locale != null) {
      emit(state.copyWith(locale: locale));
      UserPrefs.instance.setLocale(locale);
    }
  }
}
