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
  GarageCubit() : super(const GarageLoadedState(cars: []));

  Future<void> loadGarageCars() async {
    emit(GarageLoadingState());

    List<Car> carList = <Car>[];

    Car? car = await app<CarService>().getCarById(carId: 1);

    if (car != null) {
      carList.add(car);
    }

    log.info('cars loaded (${carList.length})');
    emit(GarageLoadedState(cars: carList));
  }

  void pushToAddCarScreen(BuildContext context) {
    Navigator.of(context).pushNamed(
      AddScreen.route,
    );
  }

  Future<void> updateCarData({
    required Car car,
    String? lastChangeMileageString,
    String? lastChangeDateString,
  }) async {
    if (state is GarageLoadedState) {
      var lastChangeDate = lastChangeDateString?.isNotEmpty ?? false
          ? DateFormat('dd.MM.y').parse(lastChangeDateString!)
          : DateTime.now();
      var lastChangeMileage = lastChangeMileageString?.isNotEmpty ?? false
          ? double.tryParse(lastChangeMileageString!)
          : null;

      log.info('Updating car specs..');

      app<CarService>().saveCar(
        car: car.copyWith(
          mileage: lastChangeMileage,
          date: lastChangeDate,
        ),
      );
    }
  }
}
