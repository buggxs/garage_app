import 'package:garage_app/common/i18n/delegates/mygarage_i18n.dart';
import 'package:garage_app/components/garage/i18n/garage_i18n.dart';

extension GarageTextExtension on GarageText {
  String call({
    List<String>? args,
  }) {
    return MyGarageI18n.garageText?.get(this, args) ?? '';
  }
}
