import 'package:intl/intl.dart';

// ignore: avoid_classes_with_only_static_members
abstract class NumberFormatter {
  static String mileageFormatter(num? value) {
    final NumberFormat f = NumberFormat('###,###');
    return value != null ? f.format(value).replaceAll(',', '.') : '-';
  }
}
