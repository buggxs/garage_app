abstract class TextFormatter {

  static String formatDateToMonthAndYear(DateTime? dateTime) {
    return dateTime?.month.toString().length == 1 ?
      '0${dateTime?.month}-${dateTime?.year}':
      '${dateTime?.month}-${dateTime?.year}';
  }

}