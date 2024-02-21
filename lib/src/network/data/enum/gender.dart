enum Gender {
  male(value: 'male'),
  female(value: 'female');

  final String value;
  const Gender({required this.value});

  static Gender fromValue(String value) {
    return values.firstWhere((element) => element.value == value,
        orElse: () => male);
  }
}
