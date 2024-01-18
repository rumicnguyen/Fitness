import 'dart:ui';

import 'package:fitness_app/gen/assets.gen.dart';

enum LocaleEnum {
  en(
    label: 'ENG',
    value: Locale('en'),
  ),
  vi(
    label: 'VIE',
    value: Locale('vi'),
  ),
  ;

  final String label;
  final Locale value;
  const LocaleEnum({
    required this.label,
    required this.value,
  });

  static LocaleEnum fromValue(Locale value) {
    return values.firstWhere((element) => element.value == value,
        orElse: () => en);
  }

  String get image {
    switch (this) {
      case en:
        return Assets.images.eng.path;
      case vi:
        return Assets.images.vie.path;
    }
  }
}
