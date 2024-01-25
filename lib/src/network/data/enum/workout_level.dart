enum WorkoutLevel {
  none(value: 'None'),
  any(value: 'Any'),
  simple(value: 'Simple'),
  medium(value: 'Medium'),
  entry(value: 'Entry');

  final String value;
  const WorkoutLevel({required this.value});

  static WorkoutLevel fromValue(String value) {
    return values.firstWhere((element) => element.value == value,
        orElse: () => none);
  }
}
