import 'package:garage_app/common/i18n/common_i18n.dart';
import 'package:garage_app/components/add_vehicle/I18n/add_vehicle_i18n.dart';
import 'package:garage_app/components/car/i18n/car_i18n.dart';
import 'package:garage_app/components/garage/i18n/garage_i18n.dart';

class MyGarageI18n {
  MyGarageI18n(String languageCode) {
    garageText = GarageI18n(languageCode);
    carI18n = CarI18n(languageCode);
    commonI18n = CommonI18n(languageCode);
    addVehicleI18n = AddVehicleI18n(languageCode);
  }

  static GarageI18n? garageText;
  static CarI18n? carI18n;
  static CommonI18n? commonI18n;
  static AddVehicleI18n? addVehicleI18n;
}
