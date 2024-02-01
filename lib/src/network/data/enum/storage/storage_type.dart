enum StorageType{
  image(value: 'images'),
  video(value: 'videos'),
  ;

  final String value;
  const StorageType({required this.value});
}