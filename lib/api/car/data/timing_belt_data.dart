import 'package:equatable/equatable.dart';
import 'package:garage_app/api/car/data/property_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'timing_belt_data.g.dart';

@JsonSerializable()
class TimingBeltData extends Equatable implements PropertyData {
  const TimingBeltData({
    this.id,
    this.lastChangeMileage,
    this.lastChangeDate,
    this.nextChangeMileage,
    this.nextChangeDate,
  });

  factory TimingBeltData.fromJson(Map<String, dynamic> json) =>
      _$TimingBeltDataFromJson(json);

  final int? id;

  @override
  final DateTime? lastChangeDate;

  @override
  final double? lastChangeMileage;

  @override
  final DateTime? nextChangeDate;

  @override
  final double? nextChangeMileage;

  Map<String, dynamic> toJson() => _$TimingBeltDataToJson(this);

  TimingBeltData copyWith({
    int? id,
    double? lastChangeMileage,
    DateTime? lastChangeDate,
    double? nextChangeMileage,
    DateTime? nextChangeDate,
  }) =>
      TimingBeltData(
        id: id ?? this.id,
        lastChangeMileage: lastChangeMileage ?? this.lastChangeMileage,
        lastChangeDate: lastChangeDate ?? this.lastChangeDate,
        nextChangeMileage: nextChangeMileage ?? this.nextChangeMileage,
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
