class Utils {
  static bool isToday(DateTime date) {
    DateTime now = DateTime.now();
    return date.day == now.day &&
        date.month == now.month &&
        date.year == now.year;
  }

  static bool isInThisWeek(DateTime date) {
    DateTime now = DateTime.now();
    return date.day == now.day &&
        date.month == now.month &&
        date.year == now.year;
  }

  static bool isInThisMonth(DateTime date) {
    DateTime now = DateTime.now();
    DateTime firstDayOfCurrentWeek = now.subtract(
      Duration(days: now.weekday - 1),
    );
    DateTime lastDayOfCurrentWeek = firstDayOfCurrentWeek.add(
      const Duration(days: 6),
    );

    return date.isAfter(
          firstDayOfCurrentWeek.subtract(
            const Duration(days: 1),
          ),
        ) &&
        date.isBefore(
          lastDayOfCurrentWeek.add(
            const Duration(days: 1),
          ),
        );
  }

  static DateTime firstDayOfCurrentWeek() {
    DateTime now = DateTime.now();
    int currentWeekday = now.weekday;
    return now.subtract(Duration(days: currentWeekday - 1));
  }

  static DateTime firstDayOfCurrentMonth() {
    DateTime now = DateTime.now();
    return DateTime(now.year, now.month, 1);
  }

  int getWeekdayInMonth(DateTime date) {
    DateTime firstDayOfMonth = DateTime(date.year, date.month, 1);
    int daysDifference = date.difference(firstDayOfMonth).inDays;
    int weekdayInMonth = (daysDifference ~/ 7) + 1;

    return weekdayInMonth;
  }

  static bool isDateInLastWeek(DateTime dateToCheck) {
    DateTime startOfLastWeek = getMondayOfLastWeek();
    DateTime endOfLastWeek = startOfLastWeek.add(const Duration(days: 6));

    return dateToCheck.isAfter(startOfLastWeek) &&
        dateToCheck.isBefore(endOfLastWeek);
  }

  static DateTime getMondayOfLastWeek() {
    DateTime now = DateTime.now();
    DateTime mondayOfThisWeek = now.subtract(Duration(days: now.weekday - 1));
    DateTime mondayOfLastWeek =
        mondayOfThisWeek.subtract(const Duration(days: 7));
    return mondayOfLastWeek;
  }

  static List<List<T>> splice<T>(List<T> list, int number) {
    if (list.isEmpty) {
      return [];
    }
    final spliceNumber = number < 1 ? 1 : number;
    if (spliceNumber > list.length) {
      return [list];
    }
    final int count = list.length ~/ spliceNumber;
    final List<List<T>> result = [];
    for (int i = 0; i < count; i++) {
      final index = i * spliceNumber;
      result.add(list.sublist(index, index + spliceNumber));
    }
    if (list.length % spliceNumber != 0) {
      result.add(list.sublist(count * spliceNumber));
    }
    return result;
  }
}

bool isNullOrEmpty(Object? object) {
  if (object == null) {
    return true;
  }
  if (object is String) {
    return object.trim().isEmpty;
  }
  if (object is Iterable) {
    return object.isEmpty;
  }
  if (object is Map) {
    return object.isEmpty;
  }
  return false;
}
