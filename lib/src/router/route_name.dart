enum AppRouteNames {
  home(path: '/'),
  intro(path: '/intro'),
  activity(path: '/activity'),
  workout(path: '/workout'),
  challenge(path: '/challenge'),
  account(
    path: '/account',
    paramName: 'id',
  ),

  signIn(path: '/sign-in'),
  signUp(path: '/sign-up'),
  forgotPassword(path: '/forgot'),
  setGoal(path: '/set-goal'),

  filterWorkout(path: '/filter-workout'),
  // List workout when search, show all
  listWorkout(
    path: '/workout-list',
  ),
  workoutDetails(
    path: '/workout-detail',
    paramName: 'id',
  ),
  challengeDetails(
    path: '/challenge-detail',
    paramName: 'id',
  ),
  startWorkout(
    path: '/start-workout',
    paramName: 'id',
  ),
  ;

  final String path;
  final String? paramName;
  const AppRouteNames({
    required this.path,
    this.paramName,
  });

  String get name => path;
  String get subPath {
    if (path == '/') {
      return path;
    }
    return path.replaceFirst('/', '');
  }

  String get buildPathParam => '$path:$paramName';
  String get buildSubPathParam => '$subPath:$paramName';
}
