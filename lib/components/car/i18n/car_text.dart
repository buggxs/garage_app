import 'package:garage_app/components/car/i18n/car_i18n.dart';
import 'package:garage_app/core/i18n/delegates/mygarage_i18n.dart';

extension CarTextExtension on CarText {
  String call({List<String>? args}) {
    return MyGarageI18n.carI18n?.get(this, args) ?? '';
  }
}
