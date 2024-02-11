class ListUtils {
  static List<T> getGeneral<T>(
    List<T> first,
    List<T> second,
  ) {
    Set<T> set1 = first.toSet(); 
    Set<T> set2 = second.toSet();
    Set<T> commonElements = set1.intersection(set2);
    return commonElements.toList();
  }
}
