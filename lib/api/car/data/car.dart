import 'package:equatable/equatable.dart';
import 'package:garage_app/api/car/data/technical_data.dart';
import 'package:garage_app/api/car/data/timing_belt_data.dart';
import 'package:garage_app/api/document/data/document.dart';
import 'package:garage_app/api/note/data/note.dart';
import 'package:garage_app/components/car/properties/property_tab.dart';
import 'package:json_annotation/json_annotation.dart';

import 'air_conditioner_data.dart';
import 'brake_data.dart';
import 'oil_data.dart';

part 'car.g.dart';

@JsonSerializable()
class Car extends Equatable {
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
  List<List<Document>>? documentList;
  List<Note>? noteList;

  Car(
      {required this.id,
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
      this.noteList});

  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);

  Map<String, dynamic> toJson() => _$CarToJson(this);

  Car copyWith({
    int? id,
    String? name,
    double? mileage,
    DateTime? date,
    int? vintage,
    OilData? oilData,
    AirConditionerData? airConditioner,
    BrakeData? brakeData,
    TimingBeltData? timingBeltData,
    TechnicalData? technicalData,
    List<List<Document>>? documentList,
    List<Note>? noteList,
  }) {
    return Car(
      id: id ?? this.id,
      name: name ?? this.name,
      mileage: mileage ?? this.mileage,
      date: date ?? this.date,
      vintage: vintage ?? this.vintage,
      oilData: oilData ?? this.oilData,
      airConditioner: airConditioner ?? this.airConditioner,
      brakeData: brakeData ?? this.brakeData,
      timingBeltData: timingBeltData ?? this.timingBeltData,
      technicalData: technicalData ?? this.technicalData,
      documentList: documentList ?? this.documentList,
      noteList: noteList ?? this.noteList,
    );
  }

  static CarProperty getCarProperty(dynamic data) {
    if (data is OilData) {
      return CarProperty.oil;
    }
    if (data is AirConditionerData) {
      return CarProperty.airConditioner;
    }
    if (data is BrakeData) {
      return CarProperty.brake;
    }
    if (data is TimingBeltData) {
      return CarProperty.timingBelt;
    }
    return CarProperty.oil;
  }

  String calculateCarType(dynamic data) {
    if (data is OilData) {
      return _calculateOilData();
    } else if (data is AirConditionerData) {
      return _calculateAirConditionerData();
    } else if (data is BrakeData) {
      return _calculateBrakeData();
    } else if (data is TimingBeltData) {
      return _calculateTimingBeltData();
    }
    return 'success';
  }

  String _calculateOilData() {
    double carMileage = mileage ?? 0.0;
    double lastChange = oilData?.lastChangeMileage ?? 0.0;
    double nextChange = oilData?.nextChangeMileage ?? 0.0;

    if (carMileage == 0.0) {
      return 'success';
    }

    if (lastChange == 0.0) {
      if (nextChange > carMileage) {
        if (nextChange - 1000 > carMileage) {
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

    if (carMileage == 0.0) {
      return 'success';
    }

    if (lastChange == 0.0) {
      if (nextChange > carMileage) {
        if (nextChange - 1000 > carMileage) {
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

    if (carMileage == 0.0) {
      return 'success';
    }

    if (lastChange == 0.0) {
      if (nextChange > carMileage) {
        if (nextChange - 1000 > carMileage) {
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

    if (carMileage == 0.0) {
      return 'success';
    }

    if (lastChange == 0.0) {
      if (nextChange > carMileage) {
        if (nextChange - 1000 > carMileage) {
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

  @override
  List<Object?> get props => [
        id,
        name,
        mileage,
        date,
        vintage,
        oilData,
        airConditioner,
        brakeData,
        timingBeltData,
        technicalData,
        documentList,
        noteList,
      ];
}
