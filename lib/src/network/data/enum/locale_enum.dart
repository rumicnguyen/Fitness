import 'dart:ui';

enum LocaleEnum{
  eng(label: 'ENG', value: Locale('en')),
  vi(label: 'VIE', value: Locale('vi')),
  ;

  final String label;
  final Locale value;
  const LocaleEnum({required this.label, required this.value});

  static LocaleEnum fromValue(Locale value) {
    return values.firstWhere((element) => element.value == value,
        orElse: () => eng);
  }
}