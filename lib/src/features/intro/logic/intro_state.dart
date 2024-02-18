import 'package:equatable/equatable.dart';
import 'package:fitness_app/src/services/user_prefs.dart';
import 'package:flutter/material.dart';

class IntroState extends Equatable {
  final Locale locale;

  const IntroState({
    required this.locale,
  });

  factory IntroState.ds() => IntroState(
        locale: UserPrefs.instance.getLocale(),
      );

  IntroState copyWith({
    Locale? locale,
  }) {
    return IntroState(
      locale: locale ?? this.locale,
    );
  }

  @override
  List<Object> get props => [locale];
}
