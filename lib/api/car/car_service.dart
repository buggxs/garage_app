import 'dart:convert';

import 'package:garage_app/api/api.dart';
import 'package:garage_app/misc/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CarService {
  Future<List<Car>> getAllCars();

  Future<Car?> getCarById({
    required int carId,
  });

  Future<void> saveCar({
    Car? car,
  });

  Future<void> deleteCar({required Car car});
}

class OnlineCarService extends CarService {
  @override
  Future<Car?> getCarById({required int carId}) async {
    return null;
  }

  @override
  Future<void> saveCar({Car? car}) async {}

  @override
  Future<List<Car>> getAllCars() async {
    return <Car>[];
  }

  @override
  Future<void> deleteCar({required Car car}) {
    // TODO: implement deleteCar
    throw UnimplementedError();
  }
}

class LocalCarService with LoggerMixin implements CarService {
  @override
  Future<Car?> getCarById({required int carId}) async {
    List<Car> carList = await getAllCars();

    if (carList.isEmpty) {
      return null;
    }

    return Future.value(
        carList.where((Car tmpCar) => tmpCar.id == carId).first);
  }

  @override
  Future<void> saveCar({Car? car}) async {
    if (car == null) {
      throw Exception('Nothing to save');
    }
    List<Car>? carList = await getAllCars();
    int? index = carList.indexWhere((Car tmpCar) => tmpCar.id == car.id);
    if (index == -1) {
      carList.add(car.copyWith(id: 3));
    } else {
      carList.add(car.copyWith(id: (car.id ?? 3) + 3));
    }
    log.info('Saved car with name ${car.name}');
    saveCarList(carList);
  }

  @override
  Future<List<Car>> getAllCars() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? carListString = prefs.get('car_list');
    if (carListString?.isEmpty ?? true) {
      return <Car>[];
    }
    dynamic carList = jsonDecode(carListString!);
    if (carList is List) {
      return carList
          .map((e) => Car.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      return <Car>[];
    }
  }

  @override
  Future<void> deleteCar({
    required Car car,
  }) async {
    List<Car> carList = await getAllCars();
    if (carList.isNotEmpty) {
      final int carIndex = carList.indexWhere((tempCar) => car == tempCar);
      carList.removeAt(carIndex);
      log.info('Deleted Car with name ${car.name}');
    }
    saveCarList(carList);
  }

  Future<void> saveCarList(List<Car> carList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('car_list', jsonEncode(carList));
  }
}
