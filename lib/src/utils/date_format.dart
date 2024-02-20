import 'package:intl/intl.dart';

class DateFormatUtils {
  static String formatDateTimeNow(DateTime time) {
    if (time.year != DateTime.now().year) {
      return DateFormat('MMM yyyy').format(time);
    }
    return DateFormat('dd MMM').format(time);
  }
}
