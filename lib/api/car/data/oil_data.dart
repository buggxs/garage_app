import 'package:equatable/equatable.dart';
import 'package:garage_app/api/car/data/property_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'oil_data.g.dart';

@JsonSerializable()
class OilData extends Equatable implements PropertyData {
  const OilData({
    this.id,
    this.lastChangeMileage,
    this.lastChangeDate,
    this.nextChangeMileage,
    this.nextChangeDate,
    this.oilBrand,
    this.oilType,
  });

  final int? id;
  final String? oilBrand;
  final String? oilType;

  @override
  final DateTime? lastChangeDate;

  @override
  final double? lastChangeMileage;

  @override
  final DateTime? nextChangeDate;

  @override
  final double? nextChangeMileage;

  factory OilData.fromJson(Map<String, dynamic> json) =>
      _$OilDataFromJson(json);

  Map<String, dynamic> toJson() => _$OilDataToJson(this);

  OilData copyWith({
    int? id,
    double? lastChangeMileage,
    DateTime? lastChangeDate,
    double? nextChangeMileage,
    DateTime? nextChangeDate,
    String? oilBrand,
    String? oilType,
  }) =>
      OilData(
        id: id ?? this.id,
        lastChangeMileage: lastChangeMileage ?? this.lastChangeMileage,
        lastChangeDate: lastChangeDate ?? this.lastChangeDate,
        nextChangeMileage: nextChangeMileage ?? this.nextChangeMileage,
        nextChangeDate: nextChangeDate ?? this.nextChangeDate,
        oilBrand: oilBrand ?? this.oilBrand,
        oilType: oilType ?? this.oilType,
      );

  @override
  List<Object?> get props => [
        id,
        lastChangeMileage,
        lastChangeDate,
        nextChangeMileage,
        nextChangeDate,
        oilBrand,
        oilType,
      ];
}
