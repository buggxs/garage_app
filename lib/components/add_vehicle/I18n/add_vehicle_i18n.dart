import 'package:garage_app/core/i18n/delegates/i18n.dart';

part 'add_vehicle_i18n_de.dart';
part 'add_vehicle_i18n_en.dart';

enum AddVehicleText {
  parkNewCar,
  addCarManually,
  selectCar,
  carInformationShort,
  carData,
  carImages,
  vintageMissingError,
  nameMissingError,
  tuevMissingError,
  vehicleName,
  tuev,
  vehicleTax,
  purchasePrice,
}

class AddVehicleI18n extends I18n<AddVehicleText> {
  AddVehicleI18n(String languageCode)
      : super(
          languageCode: languageCode,
          values: <String, Map<AddVehicleText, String>>{
            'en': _enValues,
            'de': _deValues,
          },
        );
}
