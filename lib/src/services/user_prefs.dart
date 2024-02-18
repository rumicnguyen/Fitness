import 'dart:convert';

import 'package:fitness_app/src/network/model/user/user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class _keys {
  static const String locale = 'locale';
  static const String user = 'user';
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

  void clear() {
    setUser(MUser.empty());
    setLocale(const Locale('en'));
  }

  // locale
  Locale getLocale() {
    final value = _prefs.getString(_keys.locale) ?? 'en';
    return Locale(value);
  }

  void setLocale(Locale value) {
    _prefs.setString(_keys.locale, value.toString().toLowerCase());
  }

  // user
  void setUser(MUser? value) {
    if (value == null) {
      _prefs.remove(_keys.user);
    } else {
      _prefs.setString(_keys.user, jsonEncode(value.toJson()));
    }
  }

  MUser? getUser() {
    final value = _prefs.getString(_keys.user);
    try {
      if ((value ?? '').isEmpty) {
        return null;
      } else {
        final map = jsonDecode(value!);
        if (map['id'] == null) {
          return null;
        } else {
          return MUser.fromJson(map);
        }
      }
    } catch (e) {
      return null;
    }
  }
}
