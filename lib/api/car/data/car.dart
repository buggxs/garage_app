import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:garage_app/api/car/data/CarPropertyStatus.dart';
import 'package:garage_app/api/car/data/property_data.dart';
import 'package:garage_app/api/car/data/technical_data.dart';
import 'package:garage_app/api/car/data/timing_belt_data.dart';
import 'package:garage_app/api/document/data/document.dart';
import 'package:garage_app/api/note/data/note.dart';
import 'package:garage_app/components/car/properties/property_tab.dart';
import 'package:garage_app/core/local_service/jsonable.dart';
import 'package:garage_app/misc/date_extension.dart';
import 'package:json_annotation/json_annotation.dart';

import 'air_conditioner_data.dart';
import 'brake_data.dart';
import 'oil_data.dart';

part 'car.g.dart';

@JsonSerializable()
class Car extends Equatable implements Jsonable<Car> {
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
    this.technicalData = const TechnicalData(),
    this.documentList,
    this.noteList,
  });

  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);

  @override
  Car fromJson(Map<String, dynamic> json) => _$CarFromJson(json);

  final int? id;
  final String? name;
  final String? brand;
  final String? model;
  final double? mileage;
  final DateTime? date;
  final int? vintage;
  @JsonKey(ignore: true)
  final List<File>? localeImages;
  final List<String>? networkImages;
  final OilData? oilData;
  final AirConditionerData? airConditioner;
  final BrakeData? brakeData;
  final TimingBeltData? timingBeltData;
  final TechnicalData? technicalData;
  final List<List<Document>>? documentList;
  @JsonKey(ignore: true)
  final List<Note>? noteList;

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

  /// Return a string from [CarPropertyStatus]
  String _calculateOilData() {
    // Define necessary mileage and/or date
    CarPropertyStatus oilStatus = CarPropertyStatus.danger;
    final double lastChangeMileage =
        oilData?.lastChangeMileage ?? mileage ?? 0.0;
    final double nextChangeMileage = oilData?.nextChangeMileage ?? 0.0;

    final DateTime? lastChangeDate = oilData?.lastChangeDate ?? date;
    final DateTime? nextChangeDate = oilData?.nextChangeDate;

    // If no mileage and date is defined than return CarPropertyStatus.danger
    if (lastChangeMileage == 0.0 && lastChangeDate == null) {
      return oilStatus.status;
    }

    // Check for mileage when monitored
    if (lastChangeMileage != 0.0 && lastChangeMileage <= nextChangeMileage) {
      if ((lastChangeMileage + 2000) < nextChangeMileage) {
        oilStatus = CarPropertyStatus.success;
      } else {
        oilStatus = CarPropertyStatus.warning;
      }
    }

    // Check for date when monitored
    if (lastChangeDate != null && nextChangeDate != null) {
      // If nextChangeDate later than lastChangeDate
      if (nextChangeDate.isAfter(lastChangeDate)) {
        oilStatus = CarPropertyStatus.success;
        // If the last changed date is 30 days away from nextChangeDate
        if (lastChangeDate.isOneMonthApart(nextChangeDate)) {
          oilStatus = CarPropertyStatus.warning;
        }
      }
    }

    return oilStatus.status;
  }

  String _calculateAirConditionerData() {
    // Define necessary local variables
    CarPropertyStatus airConditionerStatus = CarPropertyStatus.danger;

    final double lastChangeMileage =
        airConditioner?.lastChangeMileage ?? mileage ?? 0.0;
    final double nextChangeMileage = airConditioner?.nextChangeMileage ?? 0.0;

    final DateTime? lastChangeDate = airConditioner?.lastChangeDate;
    final DateTime? nextChangeDate = airConditioner?.nextChangeDate;

    // If no mileage and date is defined than return CarPropertyStatus.danger
    if (lastChangeMileage == 0.0 && lastChangeDate == null) {
      return airConditionerStatus.status;
    }

    // Check for mileage when monitored
    if (lastChangeMileage != 0.0 && lastChangeMileage <= nextChangeMileage) {
      if ((lastChangeMileage + 2000) < nextChangeMileage) {
        airConditionerStatus = CarPropertyStatus.success;
      } else {
        airConditionerStatus = CarPropertyStatus.warning;
      }
    }

    // Check for date when monitored
    if (lastChangeDate != null && nextChangeDate != null) {
      if (nextChangeDate.isAfter(lastChangeDate)) {
        airConditionerStatus = CarPropertyStatus.success;
        // If the last changed date is 30 days away from nextChangeDate
        if (lastChangeDate.isOneMonthApart(nextChangeDate)) {
          airConditionerStatus = CarPropertyStatus.warning;
        }
      }
    }

    return airConditionerStatus.status;
  }

  String _calculateBrakeData() {
    // Define necessary local variables
    CarPropertyStatus brakeStatus = CarPropertyStatus.danger;

    final double lastChangeMileage =
        brakeData?.lastChangeMileage ?? mileage ?? 0.0;
    final double nextChangeMileage = brakeData?.nextChangeMileage ?? 0.0;

    final DateTime? lastChangeDate = brakeData?.lastChangeDate;
    final DateTime? nextChangeDate = brakeData?.nextChangeDate;

    // If no mileage and date is defined than return CarPropertyStatus.danger
    if (lastChangeMileage == 0.0 && lastChangeDate == null) {
      return brakeStatus.status;
    }

    // Check for mileage when monitored
    if (lastChangeMileage != 0.0 && lastChangeMileage <= nextChangeMileage) {
      if ((lastChangeMileage + 2000) < nextChangeMileage) {
        brakeStatus = CarPropertyStatus.success;
      } else {
        brakeStatus = CarPropertyStatus.warning;
      }
    }

    // Check for date when monitored
    if (lastChangeDate != null && nextChangeDate != null) {
      if (nextChangeDate.isAfter(lastChangeDate)) {
        brakeStatus = CarPropertyStatus.success;
        // If the last changed date is 30 days away from nextChangeDate
        if (lastChangeDate.isOneMonthApart(nextChangeDate)) {
          brakeStatus = CarPropertyStatus.warning;
        }
      }
    }

    return brakeStatus.status;
  }

  String _calculateTimingBeltData() {
    // Define necessary local variables
    CarPropertyStatus timingBeltStatus = CarPropertyStatus.danger;

    final double lastChangeMileage =
        timingBeltData?.lastChangeMileage ?? mileage ?? 0.0;
    final double nextChangeMileage = timingBeltData?.nextChangeMileage ?? 0.0;

    final DateTime? lastChangeDate = timingBeltData?.lastChangeDate;
    final DateTime? nextChangeDate = timingBeltData?.nextChangeDate;

    // If no mileage and date is defined than return CarPropertyStatus.danger
    if (lastChangeMileage == 0.0 && lastChangeDate == null) {
      return timingBeltStatus.status;
    }

    // Check for mileage when monitored
    if (lastChangeMileage != 0.0 && lastChangeMileage <= nextChangeMileage) {
      if ((lastChangeMileage + 2000) < nextChangeMileage) {
        timingBeltStatus = CarPropertyStatus.success;
      } else {
        timingBeltStatus = CarPropertyStatus.warning;
      }
    }

    // Check for date when monitored
    if (lastChangeDate != null && nextChangeDate != null) {
      if (nextChangeDate.isAfter(lastChangeDate)) {
        timingBeltStatus = CarPropertyStatus.success;
        // If the last changed date is 30 days away from nextChangeDate
        if (lastChangeDate.isOneMonthApart(nextChangeDate)) {
          timingBeltStatus = CarPropertyStatus.warning;
        }
      }
    }

    return timingBeltStatus.status;
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
