import 'dart:math';

class StringUtils {
  static String shorten(String input, {int length = 20}) {
    if (input.length > length) {
      String modifiedString = "${input.substring(0, length)}...";
      return modifiedString;
    }
    return input;
  }

  static String generate({required int length}) {
    const String chars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    Random random = Random();

    return List.generate(length, (index) => chars[random.nextInt(chars.length)])
        .join();
  }

  static String generateId() {
    return generate(length: 20);
  }

  static String generateIdImageName() {
    return '${generate(length: 10)}.png';
  }
}
