import 'package:intl/intl.dart';

abstract class NumberFormatter {
  static String mileageFormatter(dynamic value) {
    var f = NumberFormat('###,###');
    return f.format(value).replaceAll(',', '.');
  }
}
