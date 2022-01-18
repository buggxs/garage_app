import 'package:json_annotation/json_annotation.dart';

part 'oil_data.g.dart';

@JsonSerializable()
class OilData {

  int id;
  double? lastChangeMileage;
  DateTime? lastChangeDate;
  double? nextChangeMileage;
  DateTime? nextChangeDate;
  String? oilBrand;
  String? oilType;

  OilData({
    required this.id,
    this.lastChangeMileage,
    this.lastChangeDate,
    this.nextChangeMileage,
    this.nextChangeDate,
    this.oilBrand,
    this.oilType
  });

  factory OilData.fromJson(Map<String, dynamic> json) =>
      _$OilDataFromJson(json);

  Map<String, dynamic> toJson() => _$OilDataToJson(this);

}