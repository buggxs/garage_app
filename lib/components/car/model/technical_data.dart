import 'package:json_annotation/json_annotation.dart';

part 'technical_data.g.dart';

@JsonSerializable()
class TechnicalData {

  int id;
  String? brand;
  String? model;
  String? type;
  String? hsn;
  String? tsn;

  TechnicalData({
    required this.id,
    this.brand,
    this.model,
    this.type,
    this.hsn,
    this.tsn
  });

  factory TechnicalData.fromJson(Map<String, dynamic> json) =>
      _$TechnicalDataFromJson(json);

  Map<String, dynamic> toJson() => _$TechnicalDataToJson(this);

}