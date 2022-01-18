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

}