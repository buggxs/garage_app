import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:garage_app/api/car/data/property_data.dart';
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
  const Car({
    this.id,
    this.name,
    this.brand,
    this.model,
    this.mileage,
    this.date,
    this.vintage,
    this.localeImages,
    this.networkImages,
    this.oilData = const OilData(),
    this.airConditioner = const AirConditionerData(),
    this.brakeData = const BrakeData(),
    this.timingBeltData = const TimingBeltData(),
    this.technicalData,
    this.documentList,
    this.noteList,
  });

  final int? id;
  final String? name;
  final String? brand;
  final String? model;
  final double? mileage;
  final DateTime? date;
  final int? vintage;
  final List<File>? localeImages;
  final List<String>? networkImages;
  final OilData? oilData;
  final AirConditionerData? airConditioner;
  final BrakeData? brakeData;
  final TimingBeltData? timingBeltData;
  final TechnicalData? technicalData;
  final List<List<Document>>? documentList;
  final List<Note>? noteList;

  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);

  Map<String, dynamic> toJson() => _$CarToJson(this);

  Car copyWith({
    int? id,
    String? name,
    String? brand,
    String? model,
    double? mileage,
    DateTime? date,
    int? vintage,
    List<File>? localeImages,
    List<String>? networkImages,
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
      brand: brand ?? this.brand,
      model: model ?? this.model,
      mileage: mileage ?? this.mileage,
      date: date ?? this.date,
      vintage: vintage ?? this.vintage,
      localeImages: localeImages ?? this.localeImages,
      networkImages: networkImages ?? this.networkImages,
      oilData: oilData ?? this.oilData,
      airConditioner: airConditioner ?? this.airConditioner,
      brakeData: brakeData ?? this.brakeData,
      timingBeltData: timingBeltData ?? this.timingBeltData,
      technicalData: technicalData ?? this.technicalData,
      documentList: documentList ?? this.documentList,
      noteList: noteList ?? this.noteList,
    );
  }

  static CarProperty getCarProperty(PropertyData? data) {
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

  String calculateCarType(PropertyData? data) {
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
    // double lastChange = oilData?.lastChangeMileage ?? 0.0;
    double nextChange = oilData?.nextChangeMileage ?? 0.0;

    if (carMileage == 0.0) {
      return 'success';
    }

    // TODO: think about how to implement date into this. What should
    // be the fallback?

    if ((carMileage <= nextChange)) {
      if ((carMileage + 2000) < nextChange) {
        return 'success';
      } else {
        return 'warning';
      }
    }

    return 'danger';
  }

  String _calculateAirConditionerData() {
    double carMileage = mileage ?? 0.0;
    // double lastChange = airConditioner?.lastChangeMileage ?? 0.0;
    double nextChange = airConditioner?.nextChangeMileage ?? 0.0;

    if (carMileage == 0.0) {
      return 'success';
    }

    // TODO: think about how to implement date into this. What should
    // be the fallback?

    if ((carMileage <= nextChange)) {
      if ((carMileage + 2000) < nextChange) {
        return 'success';
      } else {
        return 'warning';
      }
    }

    return 'danger';
  }

  String _calculateBrakeData() {
    double carMileage = mileage ?? 0.0;
    // double lastChange = brakeData?.lastChangeMileage ?? 0.0;
    double nextChange = brakeData?.nextChangeMileage ?? 0.0;

    if (carMileage == 0.0) {
      return 'success';
    }

    // TODO: think about how to implement date into this. What should
    // be the fallback?

    if ((carMileage <= nextChange)) {
      if ((carMileage + 2000) < nextChange) {
        return 'success';
      } else {
        return 'warning';
      }
    }

    return 'danger';
  }

  String _calculateTimingBeltData() {
    double carMileage = mileage ?? 0.0;
    // double lastChange = timingBeltData?.lastChangeMileage ?? 0.0;
    double nextChange = timingBeltData?.nextChangeMileage ?? 0.0;

    if (carMileage == 0.0) {
      return 'success';
    }

    // TODO: think about how to implement date into this. What should
    // be the fallback?

    if ((carMileage <= nextChange)) {
      if ((carMileage + 2000) < nextChange) {
        return 'success';
      } else {
        return 'warning';
      }
    }

    return 'danger';
  }

  bool hasAnyWarnings() {
    return _calculateOilData() != 'success' ||
        _calculateAirConditionerData() != 'success' ||
        _calculateBrakeData() != 'success' ||
        _calculateTimingBeltData() != 'success';
  }

  List<String?> get imageUrls {
    List<String> urls = <String>[];
    if (localeImages != null) {
      urls = <String>[
        ...urls,
        ...localeImages!.map((File file) => file.path).toList(),
      ];
    }
    if (networkImages != null) {
      urls = <String>[
        ...urls,
        ...networkImages!,
      ];
    }
    return urls;
  }

  @override
  List<Object?> get props => <Object?>[
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
