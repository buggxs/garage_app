import 'package:intl/intl.dart';

abstract class NumberFormatter {
  static String mileageFormatter(num? value) {
    var f = NumberFormat('###,###');
    return value != null ? f.format(value).replaceAll(',', '.') : '-';
  }
}
