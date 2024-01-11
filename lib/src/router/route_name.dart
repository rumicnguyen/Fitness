enum AppRouteName {
  home(path: '/'),;

  final String path;

  const AppRouteName({required this.path});

  String get name => path;

  String get subPath {
    if (path == '/') {
      return path;
    }
    return path.replaceFirst('/', '');
  }
}
