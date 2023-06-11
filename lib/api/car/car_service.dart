import 'dart:convert';
import 'dart:io';

import 'package:garage_app/api/api.dart';
import 'package:garage_app/api/car/local_car_repository.dart';
import 'package:garage_app/core/app_service_locator.dart';
import 'package:garage_app/misc/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CarService {
  Future<List<Car>> getAllCars();

  Future<Car?> getCarById({
    required int carId,
  });

  Future<void> saveCar({
    Car? car,
  });

  Future<void> deleteCar({
    required Car car,
  });
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
    final List<Car> carList = await getAllCars();

    if (carList.isEmpty) {
      return null;
    }

    return Future<Car?>.value(
      carList.where((Car tmpCar) => tmpCar.id == carId).first,
    );
  }

  @override
  Future<void> saveCar({Car? car}) async {
    if (car == null) {
      throw Exception('Nothing to save');
    }
    final List<Car>? carList = await getAllCars();
    final int? index = carList?.indexWhere(
      (Car tmpCar) => tmpCar.id == car?.id,
    );
    // add new car to the list
    if (index == -1) {
      car = car.copyWith(id: carList?.length);
      carList?.add(car);
      log.info('Saved new car with id ${car.id}');
    }
    // update already existing car
    else {
      carList?[index!] = car;
      log.info('Updated car with id ${car.id}');
    }
    await saveCarList(carList);

    await saveImagePermanently(car);
  }

  @override
  Future<List<Car>> getAllCars() async {
    final List<Car> localCarList =
        await app<LocalCarRepository>().getAll() ?? const <Car>[];
    return Future.wait(
      localCarList.map(loadCarImages).toList(),
    );
  }

  @override
  Future<void> deleteCar({
    required Car car,
  }) async {
    final List<Car> carList = await getAllCars();
    if (carList.isNotEmpty) {
      final int carIndex = carList.indexWhere((Car tempCar) => car == tempCar);
      carList.removeAt(carIndex);
      log.info('Deleted Car with name ${car.name}');
    }
    deleteImages(car.localeImages);
    saveCarList(carList);
  }

  Future<void> saveCarList(List<Car>? carList) async {
    if (carList == null) {
      return;
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('car_list', jsonEncode(carList));
  }

  Future<void> deleteImages(List<File>? localeImages) async {
    if (localeImages?.isEmpty ?? true) {
      return;
    }

    localeImages?.forEach((File file) async {
      await file.delete();
    });
  }

  Future<Car> loadCarImages(Car car) async {
    final Directory directory = await getApplicationDocumentsDirectory();

    return Directory('${directory.path}/car_${car.id}')
        .create(recursive: true)
        .then((Directory dir) async {
      final List<FileSystemEntity> allFiles = await dir.list().toList();
      final List<File> images = allFiles.whereType<File>().toList();
      if (images.isEmpty) {
        return car;
      }
      return car.copyWith(localeImages: images);
    });
  }

  Future<void> saveImagePermanently(Car car) async {
    // app directory
    final Directory directory = await getApplicationDocumentsDirectory();
    // specific car directory
    final Directory localDir =
        await Directory('${directory.path}/car_${car.id}').create();

    if (car.localeImages?.isEmpty ?? true) {
      return;
    }

    // Todo: just add new images on save and ignore existing ones

    for (File file in car.localeImages!) {
      final String name = basename(file.path, localDir.path);
      // If file already exists in localImages dir
      if (car.localeImages!.contains(File(name))) {
        return;
      }
      File(file.path).copy(name);
    }
  }

  String basename(String imagePath, String dirPath) {
    final String name = imagePath.split('/').last;
    return '$dirPath/$name';
  }
}
