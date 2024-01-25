enum TabBarWorkout {
  forYou(tab: 0, value: 'For you'),
  mostPopular(tab: 1, value: 'Most popular'),
  proPlan(tab: 2, value: 'Pro plan☆'),
  ;

  final int tab;
  final String value;

  const TabBarWorkout({required this.tab, required this.value});
}
