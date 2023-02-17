import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:garage_app/api/api.dart';
import 'package:garage_app/api/car/car_service.dart';
import 'package:garage_app/components/car/cubit/car_cubit.dart';
import 'package:garage_app/components/car/properties/property_tab.dart';
import 'package:garage_app/core/app_service_locator.dart';
import 'package:garage_app/misc/logger.dart';
import 'package:intl/intl.dart';

part 'property_state.dart';

class PropertyCubit extends Cubit<CarPropertiesState> with LoggerMixin {
  PropertyCubit({
    required this.carCubit,
    required Car car,
  }) : super(CarPropertiesState(car: car));

  final CarService _carService = app<CarService>();
  final CarCubit carCubit;

  void loadProperties() {
    carCubit.updateTab(0);
  }

  Future<void> updateCarProperty({
    dynamic carProperty = CarProperty.oil,
    String? lastChangeMileageString,
    String? lastChangeDateString,
  }) async {
    final DateTime lastChangeDate =
        lastChangeDateString != null && lastChangeDateString.isNotEmpty
            ? DateFormat('dd.MM.y').parse(lastChangeDateString)
            : DateTime.now();
    final double? lastChangeMileage =
        lastChangeMileageString != null && lastChangeMileageString.isNotEmpty
            ? double.tryParse(lastChangeMileageString)
            : null;

    switch (carProperty) {
      case CarProperty.oil:
        final OilData? newOilData = _calculateOilData(
          oilData: state.car.oilData,
          lastChangeMileage: lastChangeMileage,
          lastChangeDate: lastChangeDate,
        );
        emit(
          state.copyWith(
            car: state.car.copyWith(
              oilData: newOilData,
            ),
          ),
        );
        break;
      case CarProperty.airConditioner:
        final AirConditionerData? newAirConditionerData =
            _calculateAirConditionerData(
          airConditionerData: state.car.airConditioner,
          lastChangeMileage: lastChangeMileage,
          lastChangeDate: lastChangeDate,
        );
        emit(
          state.copyWith(
            car: state.car.copyWith(
              airConditioner: newAirConditionerData,
            ),
          ),
        );
        break;
      case CarProperty.brake:
        final BrakeData? brakeData = _calculateBrakeData(
          brakeData: state.car.brakeData,
          lastChangeMileage: lastChangeMileage,
          lastChangeDate: lastChangeDate,
        );
        emit(
          state.copyWith(
            car: state.car.copyWith(
              brakeData: brakeData,
            ),
          ),
        );
        break;
      case CarProperty.timingBelt:
        final TimingBeltData? timingBeltData = _calculateTimingBeltData(
          timingBeltData: state.car.timingBeltData,
          lastChangeDate: lastChangeDate,
          lastChangeMileage: lastChangeMileage,
        );
        emit(
          state.copyWith(
            car: state.car.copyWith(
              timingBeltData: timingBeltData,
            ),
          ),
        );
        break;
      default:
        log.info('Fehler beim speichern');
        break;
    }
    _carService.saveCar(car: state.car);
  }

  OilData? _calculateOilData({
    OilData? oilData,
    double? lastChangeMileage,
    DateTime? lastChangeDate,
  }) {
    final double? nextChangeMileage =
        lastChangeMileage != null ? lastChangeMileage + 15000.00 : null;
    final DateTime? nextChangeDate =
        lastChangeDate?.add(const Duration(days: 365 * 2));
    return oilData?.copyWith(
      lastChangeMileage: lastChangeMileage,
      lastChangeDate: lastChangeDate,
      nextChangeMileage: nextChangeMileage,
      nextChangeDate: nextChangeDate,
    );
  }

  AirConditionerData? _calculateAirConditionerData({
    AirConditionerData? airConditionerData,
    double? lastChangeMileage,
    DateTime? lastChangeDate,
  }) {
    final double? nextChangeMileage =
        lastChangeMileage != null ? lastChangeMileage + 50000.00 : null;
    final DateTime? nextChangeDate =
        lastChangeDate?.add(const Duration(days: 365 * 2));
    return airConditionerData?.copyWith(
      lastChangeMileage: lastChangeMileage,
      lastChangeDate: lastChangeDate,
      nextChangeDate: nextChangeDate,
      nextChangeMileage: nextChangeMileage,
    );
  }

  BrakeData? _calculateBrakeData({
    BrakeData? brakeData,
    double? lastChangeMileage,
    DateTime? lastChangeDate,
  }) {
    final double? nextChangeMileage =
        lastChangeMileage != null ? lastChangeMileage + 100000.00 : null;
    final DateTime? nextChangeDate =
        lastChangeDate?.add(const Duration(days: 365 * 5));
    return brakeData?.copyWith(
      lastChangeMileage: lastChangeMileage,
      lastChangeDate: lastChangeDate,
      nextChangeMileage: nextChangeMileage,
      nextChangeDate: nextChangeDate,
    );
  }

  TimingBeltData? _calculateTimingBeltData({
    TimingBeltData? timingBeltData,
    double? lastChangeMileage,
    DateTime? lastChangeDate,
  }) {
    final double? nextChangeMileage =
        lastChangeMileage != null ? lastChangeMileage + 80000.00 : null;
    final DateTime? nextChangeDate =
        lastChangeDate?.add(const Duration(days: 365 * 5));
    return timingBeltData?.copyWith(
      lastChangeMileage: lastChangeMileage,
      lastChangeDate: lastChangeDate,
      nextChangeMileage: nextChangeMileage,
      nextChangeDate: nextChangeDate,
    );
  }
}
