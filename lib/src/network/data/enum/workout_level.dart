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

  static bool isTrue(WorkoutLevel level, WorkoutLevel input) {
    switch (input) {
      case simple:
        if (level == simple) {
          return true;
        }
        return false;
      case medium:
        if (level == medium) {
          return true;
        }
        return false;
      case entry:
        if (level == entry) {
          return true;
        }
        return false;

      default:
        return true;
    }
  }
}
