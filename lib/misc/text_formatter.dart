abstract class TextFormatter {
  static String formatDateToMonthAndYear(DateTime? dateTime) {
    return dateTime == null
        ? '-'
        : dateTime.month.toString().length == 1
            ? '0${dateTime.month}-${dateTime.year}'
            : '${dateTime.month}-${dateTime.year}';
  }

  static String formatGermanDate(DateTime? dateTime) {
    return dateTime == null
        ? '-'
        : dateTime.month.toString().length == 1
            ? dateTime.day.toString().length == 1
                ? '${'0${dateTime.day}'}-0${dateTime.month}-${dateTime.year}'
                : '${'${dateTime.day}'}-0${dateTime.month}-${dateTime.year}'
            : dateTime.day.toString().length == 1
                ? '${'0${dateTime.day}'}-${dateTime.month}-${dateTime.year}'
                : '${'${dateTime.day}'}-${dateTime.month}-${dateTime.year}';
  }
}
