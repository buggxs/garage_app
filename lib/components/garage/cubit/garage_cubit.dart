import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:garage_app/api/car/car_service.dart';
import 'package:garage_app/api/car/data/car.dart';
import 'package:garage_app/components/add_vehicle/add_screen.dart';
import 'package:garage_app/core/app_service_locator.dart';
import 'package:garage_app/misc/logger.dart';
import 'package:intl/intl.dart';

part 'garage_state.dart';

class GarageCubit extends Cubit<GarageState> with LoggerMixin {
  GarageCubit() : super(GarageLoadedState());

  final CarService _carService = app<CarService>();

  Future<void> loadGarageCars() async {
    emit(GarageLoadingState());

    final List<Car> carList = await _carService.getAllCars();

    log.info('cars loaded (${carList.length})');
    emit(GarageLoadedState(cars: carList));
  }

  void pushToAddCarScreen(BuildContext context) {
    Navigator.of(context).pushNamed(
      AddScreen.route,
    );
  }

  Future<void> deleteCar(Car car) async {
    if (state is GarageLoadedState) {
      final List<Car> carList = (state as GarageLoadedState).cars;
      final int carIndex = carList.indexWhere((Car tmpCar) => tmpCar == car);
      carList.removeAt(carIndex);
      _carService.deleteCar(car: car);
      emit(GarageLoadedState(cars: carList));
    }
  }

  Future<void> updateCarData({
    required Car car,
    String? lastChangeMileageString,
    String? lastChangeDateString,
  }) async {
    if (state is GarageLoadedState) {
      final DateTime? lastChangeDate =
          lastChangeDateString != null && lastChangeDateString.isNotEmpty
              ? DateFormat('dd.MM.y').parse(lastChangeDateString)
              : null;
      final double? lastChangeMileage =
          lastChangeMileageString != null && lastChangeMileageString.isNotEmpty
              ? double.tryParse(lastChangeMileageString)
              : null;

      log.info('Updating car specs..');

      await _carService.saveCar(
        car: car.copyWith(
          mileage: lastChangeMileage,
          date: lastChangeDate,
        ),
      );

      loadGarageCars();
    }
  }
}
