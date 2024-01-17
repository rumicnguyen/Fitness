enum AppRouteNames {
  home(path: '/'),
  intro(path: '/intro'),
  signIn(path: '/sign-in'),
  signUp(path: '/sign-up'),
  forgotPassword(path: '/forgot'),
  firstCollectInfo(path: '/first-ci'),
  secondCollectInfo(path: '/second-ci'),
  thirthCollectInfo(path: '/thirth-ci'),
  activity(path: '/activity'),
  workout(path: '/workout'),
  filterWorkout(path: '/filter-workout'),
  challenge(path: '/challenge'),
  // List workout when search, show all
  workoutList(
    path: 'workout-list',
    paramName: 'id',
  ),
  mostPopular(
    path: 'most-popular',
    paramName: 'id',
  ),
  account(
    path: 'account',
    paramName: 'id',
  ),
  workoutDetails(
    path: 'workout-detail',
    paramName: 'id',
  ),
  challengeDetails(
    path: 'challenge-detail',
    paramName: 'id',
  ),
  startWorkout(
    path: 'start-workout',
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
