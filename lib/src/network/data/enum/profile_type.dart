enum ProfileType {
  gender(value: 'Gender', unit: ''),
  height(value: 'Height', unit: 'cm'),
  weight(value: 'Weight', unit: 'kg'),
  age(value: 'Age', unit: ''),
  target(value: 'Target', unit: ''),
  ;

  final String value;
  final String unit;
  const ProfileType({required this.value, required this.unit});
}
