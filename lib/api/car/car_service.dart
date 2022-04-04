import 'dart:convert';

import 'package:garage_app/api/api.dart';
import 'package:garage_app/api/document/data/document.dart';
import 'package:garage_app/api/note/data/note.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class CarService {
  Future<Car> getCarById({required int carId});

  void saveCar({Car car});
}

class OnlineCarService extends CarService {
  final Car _car = Car(
    id: 1,
    name: "Giggolo",
    mileage: 132000,
    date: DateTime(2003, 4, 12),
    vintage: 2003,
    oilData: OilData(
        id: 1,
        lastChangeDate: DateTime(2020, 7, 5),
        lastChangeMileage: 124000,
        nextChangeDate: DateTime(2022, 7, 5),
        nextChangeMileage: 140000),
    airConditioner: AirConditionerData(
        id: 1,
        lastChangeDate: DateTime(2020, 7, 5),
        lastChangeMileage: 124000,
        nextChangeDate: DateTime(2022, 7, 5),
        nextChangeMileage: 140000),
    brakeData: BrakeData(
        id: 1,
        lastChangeDate: DateTime(2020, 7, 5),
        lastChangeMileage: 124000,
        nextChangeDate: DateTime(2022, 7, 5),
        nextChangeMileage: 140000),
    timingBeltData: TimingBeltData(
        id: 1,
        lastChangeDate: DateTime(2020, 7, 5),
        lastChangeMileage: 124000,
        nextChangeDate: DateTime(2022, 7, 5),
        nextChangeMileage: 140000),
    technicalData: TechnicalData(
      id: 1,
      brand: "Audi",
      model: "A3",
      type: "abc",
      hsn: "3nf",
      tsn: "kl3",
    ),
    noteList: <Note>[
      Note(
        id: 1,
        note: '''Lorem ipsum dolor sit amet, consetetur sadipscing elitr, 
            sed diam nonumy eirmod tempor invidunt ut 
            labore et dolore magna aliquyam''',
        dateTime: DateTime(2022, 2, 20),
      ),
      Note(
        id: 2,
        note: '''Lorem ipsum dolor sit amet, consetetur sadipscing elitr, 
            sed diam nonumy eirmod tempor invidunt ut 
            labore et dolore magna aliquyam''',
        dateTime: DateTime.now(),
      ),
    ],
  );

  @override
  Future<Car> getCarById({required int carId}) async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    String objString = jsonEncode(_car);
    // return Car.fromJson(jsonDecode(response.body));
    Future.delayed(const Duration(seconds: 2));

    return Car.fromJson(jsonDecode(objString));
  }

  @override
  void saveCar({Car? car}) {}
}

class LocalCarService implements CarService {
  final Car _car = Car(
      id: 1,
      name: "Giggolo",
      mileage: 132000,
      date: DateTime(2003, 4, 12),
      vintage: 2003,
      oilData: OilData(
          id: 1,
          lastChangeDate: DateTime(2020, 7, 5),
          lastChangeMileage: 124000,
          nextChangeDate: DateTime(2022, 7, 5),
          nextChangeMileage: 140000),
      airConditioner: AirConditionerData(
          id: 1,
          lastChangeDate: DateTime(2020, 7, 5),
          lastChangeMileage: 124000,
          nextChangeDate: DateTime(2022, 7, 5),
          nextChangeMileage: 140000),
      brakeData: BrakeData(
          id: 1,
          lastChangeDate: DateTime(2020, 7, 5),
          lastChangeMileage: 124000,
          nextChangeDate: DateTime(2022, 7, 5),
          nextChangeMileage: 140000),
      timingBeltData: TimingBeltData(
          id: 1,
          lastChangeDate: DateTime(2020, 7, 5),
          lastChangeMileage: 124000,
          nextChangeDate: DateTime(2022, 7, 5),
          nextChangeMileage: 140000),
      technicalData: TechnicalData(
        id: 1,
        brand: "Audi",
        model: "A3",
        type: "abc",
        hsn: "3nf",
        tsn: "kl3",
      ),
      noteList: <Note>[
        Note(
          id: 1,
          note: '''Lorem ipsum dolor sit amet, consetetur sadipscing elitr, 
            sed diam nonumy eirmod tempor invidunt ut 
            labore et dolore magna aliquyam''',
          dateTime: DateTime(2022, 2, 20),
        ),
        Note(
          id: 2,
          note: '''Lorem ipsum dolor sit amet, consetetur sadipscing elitr, 
            sed diam nonumy eirmod tempor invidunt ut 
            labore et dolore magna aliquyam''',
          dateTime: DateTime.now(),
        ),
      ],
      documentList: [
        [
          Document(id: 1, name: 'Fahrzeugschein'),
          Document(id: 2, name: 'Fahrzeugbrief'),
          Document(id: 3, name: 'Kaufvertrag'),
        ],
        [
          Document(id: 4, name: 'Auspuff ausgetauscht'),
          Document(id: 5, name: 'Zahnriemenwechsel'),
          Document(id: 6, name: 'Ölwechsel'),
        ],
        []
      ]);

  @override
  Future<Car> getCarById({required int carId}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String carString = prefs.get('car_${_car.id}');
    return Car.fromJson(jsonDecode(carString));
  }

  @override
  Future<void> saveCar({Car? car}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('car_${car?.id}', jsonEncode(_car));
  }
}
