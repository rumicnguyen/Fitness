import 'dart:convert';

import 'package:crypto/crypto.dart';

class PasswordUtils {
  static String encodeSHA256(String data) {
    var bytesToHash = utf8.encode(data);
    return sha256.convert(bytesToHash).toString();
  }

  static bool compare(String data, String hash) {
    var bytesToHash = utf8.encode(data);
    var sha256Digest = sha256.convert(bytesToHash);
    if (sha256Digest.toString() == hash) {
      return true;
    }
    return false;
  }
}
