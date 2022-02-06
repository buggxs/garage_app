import 'package:garage_app/components/car/documents/model/document.dart';
import 'package:garage_app/components/car/model/brake_data.dart';
import 'package:garage_app/components/car/model/technical_data.dart';
import 'package:garage_app/components/car/model/timing_belt_data.dart';
import 'package:garage_app/components/car/notes/model/note.dart';

import 'air_conditioner_data.dart';
import 'oil_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'car.g.dart';

@JsonSerializable()
class Car {

  int id;
  String? name;
  double? mileage;
  DateTime? date;
  int? vintage;
  OilData? oilData;
  AirConditionerData? airConditioner;
  BrakeData? brakeData;
  TimingBeltData? timingBeltData;
  TechnicalData? technicalData;
  List<Document>? documentList;
  List<Note>? noteList;

  Car({
    required this.id,
    this.name,
    this.mileage,
    this.date,
    this.vintage,
    this.oilData,
    this.airConditioner,
    this.brakeData,
    this.timingBeltData,
    this.technicalData,
    this.documentList,
    this.noteList
  });

  factory Car.fromJson(Map<String, dynamic> json) =>
      _$CarFromJson(json);

  Map<String, dynamic> toJson() => _$CarToJson(this);

  String calculateCarType(dynamic data) {
    if(data is OilData) {
      return _calculateOilData();
    }
    else if(data is AirConditionerData) {
      return _calculateAirConditionerData();
    }
    else if(data is BrakeData) {
      return _calculateBrakeData();
    }
    else if(data is TimingBeltData) {
      return _calculateTimingBeltData();
    }
    return 'success';
  }

  String _calculateOilData() {
    double carMileage = mileage ?? 0.0;
    double lastChange = oilData?.lastChangeMileage ?? 0.0;
    double nextChange = oilData?.nextChangeMileage ?? 0.0;

    if(carMileage == 0.0) {
      return 'success';
    }

    if(lastChange == 0.0) {
      if(nextChange > carMileage) {
        if(nextChange - 1000 > carMileage) {
          return 'success';
        } else {
          return 'warning';
        }
      } else {
        return 'danger';
      }
    }
    return 'success';
  }

  String _calculateAirConditionerData() {
    double carMileage = mileage ?? 0.0;
    double lastChange = airConditioner?.lastChangeMileage ?? 0.0;
    double nextChange = airConditioner?.nextChangeMileage ?? 0.0;

    if(carMileage == 0.0) {
      return 'success';
    }

    if(lastChange == 0.0) {
      if(nextChange > carMileage) {
        if(nextChange - 1000 > carMileage) {
          return 'success';
        } else {
          return 'warning';
        }
      } else {
        return 'danger';
      }
    }
    return 'success';
  }

  String _calculateBrakeData() {
    double carMileage = mileage ?? 0.0;
    double lastChange = brakeData?.lastChangeMileage ?? 0.0;
    double nextChange = brakeData?.nextChangeMileage ?? 0.0;

    if(carMileage == 0.0) {
      return 'success';
    }

    if(lastChange == 0.0) {
      if(nextChange > carMileage) {
        if(nextChange - 1000 > carMileage) {
          return 'success';
        } else {
          return 'warning';
        }
      } else {
        return 'danger';
      }
    }
    return 'success';
  }

  String _calculateTimingBeltData() {
    double carMileage = mileage ?? 0.0;
    double lastChange = timingBeltData?.lastChangeMileage ?? 0.0;
    double nextChange = timingBeltData?.nextChangeMileage ?? 0.0;

    if(carMileage == 0.0) {
      return 'success';
    }

    if(lastChange == 0.0) {
      if(nextChange > carMileage) {
        if(nextChange - 1000 > carMileage) {
          return 'success';
        } else {
          return 'warning';
        }
      } else {
        return 'danger';
      }
    }
    return 'success';
  }
}