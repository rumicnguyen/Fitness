enum EntryFee {
  any(value: 'Any', minValue: -1, maxValue: 0),
  lt300(value: '< 300k', minValue: 0, maxValue: 300),
  lt500(value: '< 500k', minValue: 0, maxValue: 500),
  lt1000(value: '< 1000k', minValue: 0, maxValue: 1000),
  gt1000(value: '> 1000k', minValue: 1000, maxValue: 100000),
  ;

  final String value;
  final int minValue;
  final int maxValue;

  const EntryFee({
    required this.value,
    required this.minValue,
    required this.maxValue,
  });

  static EntryFee fromValue(String value) {
    return values.firstWhere((element) => element.value == value,
        orElse: () => any);
  }
}
