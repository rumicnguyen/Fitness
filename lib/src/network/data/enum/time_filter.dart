enum TimeFilter {
  any(value: 'Any', minValue: -1, maxValue: 0),
  lt15m(value: '< 15\'', minValue: 0, maxValue: 15),
  lt30m(value: '< 30\'', minValue: 0, maxValue: 30),
  lt60(value: '< 60\'', minValue: 0, maxValue: 60),
  lt120(value: '< 120\'', minValue: 0, maxValue: 120),
  ;

  final String value;
  final int minValue;
  final int maxValue;

  const TimeFilter({
    required this.value,
    required this.minValue,
    required this.maxValue,
  });

  static TimeFilter fromValue(String value) {
    return values.firstWhere((element) => element.value == value,
        orElse: () => any);
  }
}
