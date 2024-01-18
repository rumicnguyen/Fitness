import 'package:equatable/equatable.dart';
import 'package:fitness_app/src/services/user_prefs.dart';
import 'package:flutter/material.dart';

class SettingState extends Equatable {
  final Locale locale;

  const SettingState({
    required this.locale,
  });

  factory SettingState.ds() => SettingState(
        locale: UserPrefs.instance.getLocale(),
      );

  SettingState copyWith({
    Locale? locale,
  }) {
    return SettingState(
      locale: locale ?? this.locale,
    );
  }

  @override
  List<Object> get props => [locale];
}
