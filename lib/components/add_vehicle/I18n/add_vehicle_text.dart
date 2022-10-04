import 'package:garage_app/components/add_vehicle/I18n/add_vehicle_i18n.dart';
import 'package:garage_app/core/i18n/delegates/mygarage_i18n.dart';

extension AddVehicleTextExtension on AddVehicleText {
  String call({
    List<String>? args,
  }) {
    return MyGarageI18n.addVehicleI18n?.get(this, args) ?? '';
  }
}
