enum DisciplineActivity {
  any(value: 'Any'),
  gym(value: 'gym'),
  cardio(value: 'cardio'),
  pilates(value: 'pilates'),
  ;

  final String value;
  const DisciplineActivity({required this.value});

  static DisciplineActivity fromValue(String value) {
    return values.firstWhere((element) => element.value == value,
        orElse: () => any);
  }

  static bool isTrue(DisciplineActivity discipline, DisciplineActivity input) {
    switch (input) {
      case gym:
        if (discipline == gym) {
          return true;
        }
        return false;
      case cardio:
        if (discipline == cardio) {
          return true;
        }
        return false;
      case pilates:
        if (discipline == pilates) {
          return true;
        }
        return false;
      default:
        return true;
    }
  }
}
