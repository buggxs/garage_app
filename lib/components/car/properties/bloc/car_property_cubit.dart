import 'package:bloc/bloc.dart';
import 'package:garage_app/common/service/app_service.dart';
import 'package:garage_app/components/car/model/car.dart';
import 'package:garage_app/components/car/model/oil_data.dart';
import 'package:garage_app/components/car/properties/property_tab.dart';
import 'package:garage_app/components/car/service/car_service.dart';
import 'package:intl/intl.dart';

part 'car_property_state.dart';

class CarPropertyCubit extends Cubit<CarPropertyLoaded> {
  CarPropertyCubit({
    required Car car,
  }) : super(CarPropertyLoaded(car));

  final LocalCarService _carService = app<LocalCarService>();

  Future<void> updateCarProperty({
    required dynamic carPropertyData,
    String? lastChangeMileageString,
    String? lastChangeDateString,
  }) async {
    CarProperty carProperty = Car.getCarProperty(carPropertyData);
    var lastChangeDate =
        lastChangeDateString != null && lastChangeDateString.isNotEmpty
            ? DateFormat('dd.MM.y').parse(lastChangeDateString)
            : DateTime.now();
    var lastChangeMileage =
        lastChangeMileageString != null && lastChangeMileageString.isNotEmpty
            ? double.tryParse(lastChangeMileageString)
            : null;
    switch (carProperty) {
      case CarProperty.oil:
        OilData newOilData = _calculateOilData(
          oilData: state.car.oilData!,
          lastChangeMileage: lastChangeMileage,
          lastChangeDate: lastChangeDate,
        );
        emit(
          CarPropertyLoaded(
            state.car.copyWith(
              oilData: newOilData,
            ),
          ),
        );
        break;
      case CarProperty.airConditioner:
        emit(
          CarPropertyLoaded(
            state.car.copyWith(
              airConditioner: state.car.airConditioner?.copyWith(
                lastChangeMileage: lastChangeMileage,
                lastChangeDate: lastChangeDate,
              ),
            ),
          ),
        );
        break;
      default:
        print('Fehler beim speichern');
        break;
    }
    _carService.saveCar(car: state.car);
  }

  OilData _calculateOilData({
    required OilData oilData,
    double? lastChangeMileage,
    required DateTime lastChangeDate,
  }) {
    double? nextChangeMileage =
        lastChangeMileage != null ? lastChangeMileage + 15000.00 : null;
    DateTime nextChangeDate =
        lastChangeDate.add(const Duration(days: (365 * 2)));
    return oilData.copyWith(
      lastChangeMileage: lastChangeMileage,
      lastChangeDate: lastChangeDate,
      nextChangeMileage: nextChangeMileage,
      nextChangeDate: nextChangeDate,
    );
  }
}
