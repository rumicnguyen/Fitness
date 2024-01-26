enum DateFilter {
  any(
    value: 'Any',
  ),
  toDay(
    value: 'Today',
  ),
  weekly(
    value: 'Weekly',
  ),
  monthly(
    value: 'Monthly',
  ),
  allTime(
    value: 'All-time',
  ),
  ;

  final String value;

  const DateFilter({
    required this.value,
  });

  static DateFilter fromValue(String value) {
    return values.firstWhere((element) => element.value == value,
        orElse: () => any);
  }
}
