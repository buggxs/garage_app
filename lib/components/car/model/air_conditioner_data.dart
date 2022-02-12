import 'package:json_annotation/json_annotation.dart';

part 'air_conditioner_data.g.dart';

@JsonSerializable()
class AirConditionerData {
  int id;
  double? lastChangeMileage;
  DateTime? lastChangeDate;
  double? nextChangeMileage;
  DateTime? nextChangeDate;

  AirConditionerData(
      {required this.id,
      this.lastChangeMileage,
      this.lastChangeDate,
      this.nextChangeMileage,
      this.nextChangeDate});

  factory AirConditionerData.fromJson(Map<String, dynamic> json) =>
      _$AirConditionerDataFromJson(json);

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
        nextChangeMileage: lastChangeMileage ?? this.lastChangeMileage,
        nextChangeDate: nextChangeDate ?? this.nextChangeDate,
      );
}
