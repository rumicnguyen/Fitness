enum WorkoutLevel {
  none(value: 'None'),
  simple(value: 'Simple'),
  medium(value: 'Medium'),
  entry(value: 'Entry');

  final String value;
  const WorkoutLevel({required this.value});
}
