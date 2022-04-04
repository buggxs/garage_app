import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'timing_belt_data.g.dart';

@JsonSerializable()
class TimingBeltData extends Equatable {
  int id;
  double? lastChangeMileage;
  DateTime? lastChangeDate;
  double? nextChangeMileage;
  DateTime? nextChangeDate;

  TimingBeltData(
      {required this.id,
      this.lastChangeMileage,
      this.lastChangeDate,
      this.nextChangeMileage,
      this.nextChangeDate});

  factory TimingBeltData.fromJson(Map<String, dynamic> json) =>
      _$TimingBeltDataFromJson(json);

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
  List<Object?> get props => [
        id,
        lastChangeMileage,
        lastChangeDate,
        nextChangeMileage,
        nextChangeDate,
      ];
}
