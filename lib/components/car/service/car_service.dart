import 'dart:convert';

import 'package:garage_app/components/car/model/air_conditioner_data.dart';
import 'package:garage_app/components/car/model/brake_data.dart';
import 'package:garage_app/components/car/model/oil_data.dart';
import 'package:garage_app/components/car/model/technical_data.dart';
import 'package:garage_app/components/car/model/timing_belt_data.dart';
import 'package:http/http.dart' as http;
import 'package:garage_app/components/car/model/car.dart';

abstract class CarService {

  Future<Car> getCarById({required String carId});

}

class OnlineCarService extends CarService {

  Car _car = new Car(
    id: 1,
    name: "Giggolo",
    mileage: 132000,
    date: new DateTime(2003, 4, 12),
    vintage: 2003,
    oilData: new OilData(
      id: 1,
      lastChangeDate: new DateTime(2020, 7, 5),
      lastChangeMileage: 124000,
      nextChangeDate: new DateTime(2022, 7, 5),
      nextChangeMileage: 140000
    ),
    airConditioner: new AirConditionerData(
      id: 1,
      lastChangeDate: new DateTime(2020, 7, 5),
      lastChangeMileage: 124000,
      nextChangeDate: new DateTime(2022, 7, 5),
      nextChangeMileage: 140000
    ),
    brakeData: new BrakeData(
      id: 1,
      lastChangeDate: new DateTime(2020, 7, 5),
      lastChangeMileage: 124000,
      nextChangeDate: new DateTime(2022, 7, 5),
      nextChangeMileage: 140000
    ),
    timingBeltData: new TimingBeltData(
      id: 1,
      lastChangeDate: new DateTime(2020, 7, 5),
      lastChangeMileage: 124000,
      nextChangeDate: new DateTime(2022, 7, 5),
      nextChangeMileage: 140000
    ),
    technicalData: new TechnicalData(
      id: 1,
      brand: "Audi",
      model: "A3",
      type: "abc",
      hsn: "3nf",
      tsn: "kl3"
    ),
  );

  @override
  Future<Car> getCarById({required String carId}) async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    String objString = jsonEncode(_car);
    // return Car.fromJson(jsonDecode(response.body));
    Future.delayed(Duration(seconds: 2));

    return Car.fromJson(jsonDecode(objString));
  }



}