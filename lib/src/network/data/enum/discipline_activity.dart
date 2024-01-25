enum DisciplineActivity{
  any(value: 'Any'),
  gym(value: 'Gym'),
  ;

  final String value;
  const DisciplineActivity({required this.value});

  static DisciplineActivity fromValue(String value) {
    return values.firstWhere((element) => element.value == value,
        orElse: () => any);
  }
}