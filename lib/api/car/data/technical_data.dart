import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'technical_data.g.dart';

@JsonSerializable()
class TechnicalData extends Equatable {
  final int? id;
  final String? type;
  final String? hsn;
  final String? tsn;

  const TechnicalData({
    this.id,
    this.type,
    this.hsn,
    this.tsn,
  });

  factory TechnicalData.fromJson(Map<String, dynamic> json) =>
      _$TechnicalDataFromJson(json);

  Map<String, dynamic> toJson() => _$TechnicalDataToJson(this);

  TechnicalData copyWith({
    int? id,
    String? brand,
    String? model,
    String? type,
    String? hsn,
    String? tsn,
  }) =>
      TechnicalData(
        id: id ?? this.id,
        type: type ?? this.type,
        hsn: hsn ?? this.hsn,
        tsn: tsn ?? this.tsn,
      );

  @override
  List<Object?> get props => [
        id,
        type,
        hsn,
        tsn,
      ];
}
