import 'package:json_annotation/json_annotation.dart';

part 'timing_belt_data.g.dart';

@JsonSerializable()
class TimingBeltData {

  int id;
  double? lastChangeMileage;
  DateTime? lastChangeDate;
  double? nextChangeMileage;
  DateTime? nextChangeDate;

  TimingBeltData({
    required this.id,
    this.lastChangeMileage,
    this.lastChangeDate,
    this.nextChangeMileage,
    this.nextChangeDate
  });

  factory TimingBeltData.fromJson(Map<String, dynamic> json) =>
      _$TimingBeltDataFromJson(json);

  Map<String, dynamic> toJson() => _$TimingBeltDataToJson(this);

}