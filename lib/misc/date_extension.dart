extension DateExtension on DateTime {
  /// Checks if this [DateTime] is 30 days before the [date] parameter.
  /// returns [bool]
  bool isOneMonthApart(DateTime date) {
    final Duration difference = this.difference(date);
    return difference.inDays.abs() <= 30;
  }
}
