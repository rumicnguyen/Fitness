class Utils {
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
}
