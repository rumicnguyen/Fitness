class StringUtils {
  static String shorten(String input) {
    if (input.length > 20) {
      String modifiedString = "${input.substring(0, 20)}...";
      return modifiedString;
    }
    return input;
  }
}
