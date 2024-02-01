import 'dart:math';

class StringUtils {
  static String shorten(String input) {
    if (input.length > 20) {
      String modifiedString = "${input.substring(0, 20)}...";
      return modifiedString;
    }
    return input;
  }

  static String generateIdImageName() {
    const String chars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    Random random = Random();

    return '${List.generate(10, (index) => chars[random.nextInt(chars.length)]).join()}.png';
  }
}
