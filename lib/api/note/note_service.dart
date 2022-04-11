import 'dart:convert';

import 'package:garage_app/api/car/car_service.dart';
import 'package:garage_app/api/car/data/car.dart';
import 'package:garage_app/core/app_service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/note.dart';

abstract class NoteService {
  Future<List<Note>?> getCarNotes(int carId);

  void saveNote({
    int? carId,
    Car? car,
    required Note note,
  });
}

class LocalNoteService implements NoteService {
  @override
  Future<List<Note>?> getCarNotes(int carId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String carString = prefs.get('car_$carId');
    return Car.fromJson(jsonDecode(carString)).noteList;
  }

  @override
  void saveNote({
    int? carId,
    Car? car,
    required Note note,
  }) async {
    if (car == null) {
      if (carId == null) return;
      car = await app<CarService>().getCarById(carId: carId);
    }
    car?.noteList?.add(note);
    app<CarService>().saveCar(car: car!);
  }
}
