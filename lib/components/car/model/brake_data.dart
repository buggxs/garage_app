import 'package:json_annotation/json_annotation.dart';

part 'brake_data.g.dart';

@JsonSerializable()
class BrakeData {
  int id;
  double? lastChangeMileage;
  DateTime? lastChangeDate;
  double? nextChangeMileage;
  DateTime? nextChangeDate;

  BrakeData(
      {required this.id,
      this.lastChangeMileage,
      this.lastChangeDate,
      this.nextChangeMileage,
      this.nextChangeDate});

  factory BrakeData.fromJson(Map<String, dynamic> json) =>
      _$BrakeDataFromJson(json);

  Map<String, dynamic> toJson() => _$BrakeDataToJson(this);

  BrakeData copyWith(
    int? id,
    double? lastChangeMileage,
    DateTime? lastChangeDate,
    double? nextChangeMileage,
    DateTime? nextChangeDate,
  ) =>
      BrakeData(
        id: id ?? this.id,
        lastChangeMileage: lastChangeMileage ?? this.lastChangeMileage,
        lastChangeDate: lastChangeDate ?? this.lastChangeDate,
        nextChangeMileage: nextChangeMileage ?? this.nextChangeMileage,
        nextChangeDate: nextChangeDate ?? this.nextChangeDate,
      );
}
