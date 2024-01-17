import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class _keys {
  static const String locale = 'locale';
}

class UserPrefs {
  factory UserPrefs() => instance;
  UserPrefs._internal();

  static final UserPrefs instance = UserPrefs._internal();
  static UserPrefs get I => instance;
  late SharedPreferences _prefs;
  Future initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // locale
  Locale getLocale() {
    final value = _prefs.getString(_keys.locale) ?? 'en';
    return Locale(value);
  }

  void setLocale(Locale value) {
    _prefs.setString(_keys.locale, value.toString().toLowerCase());
  }
}
