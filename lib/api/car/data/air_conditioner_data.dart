import 'package:equatable/equatable.dart';
import 'package:garage_app/api/car/data/property_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'air_conditioner_data.g.dart';

@JsonSerializable()
class AirConditionerData extends Equatable implements PropertyData {
  const AirConditionerData({
    this.id,
    this.lastChangeMileage,
    this.lastChangeDate,
    this.nextChangeMileage,
    this.nextChangeDate,
  });

  factory AirConditionerData.fromJson(Map<String, dynamic> json) =>
      _$AirConditionerDataFromJson(json);

  final int? id;

  @override
  final DateTime? lastChangeDate;

  @override
  final double? lastChangeMileage;

  @override
  final DateTime? nextChangeDate;

  @override
  final double? nextChangeMileage;

  Map<String, dynamic> toJson() => _$AirConditionerDataToJson(this);

  AirConditionerData copyWith({
    int? id,
    double? lastChangeMileage,
    DateTime? lastChangeDate,
    double? nextChangeMileage,
    DateTime? nextChangeDate,
  }) =>
      AirConditionerData(
        id: id ?? this.id,
        lastChangeMileage: lastChangeMileage ?? this.lastChangeMileage,
        lastChangeDate: lastChangeDate ?? this.lastChangeDate,
        nextChangeMileage: lastChangeMileage ?? this.nextChangeMileage,
        nextChangeDate: nextChangeDate ?? this.nextChangeDate,
      );

  @override
  List<Object?> get props => <Object?>[
        id,
        lastChangeMileage,
        lastChangeDate,
        nextChangeMileage,
        nextChangeDate,
      ];
}
