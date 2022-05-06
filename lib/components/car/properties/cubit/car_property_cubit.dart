import 'package:bloc/bloc.dart';
import 'package:garage_app/api/api.dart';
import 'package:garage_app/api/car/car_service.dart';
import 'package:garage_app/components/car/properties/property_tab.dart';
import 'package:garage_app/core/app_service_locator.dart';
import 'package:intl/intl.dart';

part 'car_property_state.dart';

class CarPropertyCubit extends Cubit<CarPropertyLoaded> {
  CarPropertyCubit({
    required Car car,
  }) : super(CarPropertyLoaded(car));

  final CarService _carService = app<CarService>();

  Future<void> updateCarProperty({
    dynamic carProperty = CarProperty.oil,
    String? lastChangeMileageString,
    String? lastChangeDateString,
  }) async {
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
        AirConditionerData newAirConditionerData = _calculateAirConditionerData(
          airConditionerData: state.car.airConditioner!,
          lastChangeMileage: lastChangeMileage,
          lastChangeDate: lastChangeDate,
        );
        emit(
          CarPropertyLoaded(
            state.car.copyWith(
              airConditioner: newAirConditionerData,
            ),
          ),
        );
        break;
      case CarProperty.brake:
        BrakeData brakeData = _calculateBrakeData(
          brakeData: state.car.brakeData!,
          lastChangeMileage: lastChangeMileage,
          lastChangeDate: lastChangeDate,
        );
        emit(
          CarPropertyLoaded(
            state.car.copyWith(
              brakeData: brakeData,
            ),
          ),
        );
        break;
      case CarProperty.timingBelt:
        TimingBeltData timingBeltData = _calculateTimingBeltData(
          timingBeltData: state.car.timingBeltData!,
          lastChangeDate: lastChangeDate,
          lastChangeMileage: lastChangeMileage,
        );
        emit(
          CarPropertyLoaded(
            state.car.copyWith(
              timingBeltData: timingBeltData,
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

  AirConditionerData _calculateAirConditionerData({
    required AirConditionerData airConditionerData,
    double? lastChangeMileage,
    required DateTime lastChangeDate,
  }) {
    double? nextChangeMileage =
        lastChangeMileage != null ? lastChangeMileage + 50000.00 : null;
    DateTime nextChangeDate =
        lastChangeDate.add(const Duration(days: (365 * 2)));
    return airConditionerData.copyWith(
      lastChangeMileage: lastChangeMileage,
      lastChangeDate: lastChangeDate,
      nextChangeDate: nextChangeDate,
      nextChangeMileage: nextChangeMileage,
    );
  }

  BrakeData _calculateBrakeData({
    required BrakeData brakeData,
    double? lastChangeMileage,
    required DateTime lastChangeDate,
  }) {
    double? nextChangeMileage =
        lastChangeMileage != null ? lastChangeMileage + 100000.00 : null;
    DateTime nextChangeDate =
        lastChangeDate.add(const Duration(days: (365 * 5)));
    return brakeData.copyWith(
      lastChangeMileage: lastChangeMileage,
      lastChangeDate: lastChangeDate,
      nextChangeMileage: nextChangeMileage,
      nextChangeDate: nextChangeDate,
    );
  }

  TimingBeltData _calculateTimingBeltData({
    required TimingBeltData timingBeltData,
    double? lastChangeMileage,
    required DateTime lastChangeDate,
  }) {
    double? nextChangeMileage =
        lastChangeMileage != null ? lastChangeMileage + 80000.00 : null;
    DateTime nextChangeDate =
        lastChangeDate.add(const Duration(days: (365 * 5)));
    return timingBeltData.copyWith(
      lastChangeMileage: lastChangeMileage,
      lastChangeDate: lastChangeDate,
      nextChangeMileage: nextChangeMileage,
      nextChangeDate: nextChangeDate,
    );
  }
}
