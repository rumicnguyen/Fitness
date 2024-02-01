enum StorageFolder {
  app(value: 'app'),
  workouts(value: 'workouts'),
  challenges(value: 'challenges'),
  users(value: 'users'),
  ;

  final String value;
  const StorageFolder({required this.value});
}
