import 'package:garage_app/components/car/i18n/car_i18n.dart';
import 'package:garage_app/components/garage/i18n/garage_i18n.dart';

class MyGarageI18n {
  MyGarageI18n(String languageCode) {
    garageText = GarageI18n(languageCode);
    carI18n = CarI18n(languageCode);
  }

  static GarageI18n? garageText;
  static CarI18n? carI18n;
}
