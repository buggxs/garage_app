import 'package:equatable/equatable.dart';
import 'package:garage_app/api/car/data/property_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'brake_data.g.dart';

@JsonSerializable()
class BrakeData extends Equatable implements PropertyData {
  const BrakeData({
    this.id,
    this.lastChangeMileage,
    this.lastChangeDate,
    this.nextChangeMileage,
    this.nextChangeDate,
  });

  factory BrakeData.fromJson(Map<String, dynamic> json) =>
      _$BrakeDataFromJson(json);

  final int? id;

  @override
  final DateTime? lastChangeDate;

  @override
  final double? lastChangeMileage;

  @override
  final DateTime? nextChangeDate;

  @override
  final double? nextChangeMileage;

  Map<String, dynamic> toJson() => _$BrakeDataToJson(this);

  BrakeData copyWith({
    int? id,
    double? lastChangeMileage,
    DateTime? lastChangeDate,
    double? nextChangeMileage,
    DateTime? nextChangeDate,
  }) =>
      BrakeData(
        id: id ?? this.id,
        lastChangeMileage: lastChangeMileage ?? this.lastChangeMileage,
        lastChangeDate: lastChangeDate ?? this.lastChangeDate,
        nextChangeMileage: nextChangeMileage ?? this.nextChangeMileage,
        nextChangeDate: nextChangeDate ?? this.nextChangeDate,
      );

  @override
  List<Object?> get props => <Object?>[
        id,
        lastChangeDate,
        lastChangeMileage,
        nextChangeDate,
        nextChangeMileage,
      ];
}
