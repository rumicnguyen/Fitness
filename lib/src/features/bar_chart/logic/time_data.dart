enum TimeData {
  hour_1h(label: '01\nAM', value: 1),
  hour_2h(label: '02\nAM', value: 2),
  hour_3h(label: '03\nAM', value: 3),
  hour_4h(label: '04\nAM', value: 4),
  hour_5h(label: '05\nAM', value: 5),
  hour_6h(label: '06\nAM', value: 6),
  hour_7h(label: '07\nAM', value: 7),
  hour_8h(label: '08\nAM', value: 8),
  hour_9h(label: '09\nAM', value: 9),
  hour_10h(label: '10\nAM', value: 10),
  hour_11h(label: '11\nAM', value: 11),
  hour_12h(label: '12\nAM', value: 12),
  hour_13h(label: '01\nPM', value: 13),
  hour_14h(label: '02\nPM', value: 14),
  hour_15h(label: '03\nPM', value: 15),
  hour_16h(label: '04\nPM', value: 16),
  hour_17h(label: '05\nPM', value: 17),
  hour_18h(label: '06\nPM', value: 18),
  hour_19h(label: '07\nPM', value: 19),
  hour_20h(label: '08\nPM', value: 20),
  hour_21h(label: '09\nPM', value: 21),
  hour_22h(label: '10\nPM', value: 22),
  hour_23h(label: '11\nPM', value: 23),
  hour_24h(label: '12\nPM', value: 24),
  ;

  final String label;
  final int value;

  const TimeData({required this.label, required this.value});
}
