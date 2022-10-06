import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'technical_data.g.dart';

enum FuelType {
  diesel,
  petrol,
  electric,
}

@JsonSerializable()
class TechnicalData extends Equatable {
  const TechnicalData({
    this.id,
    this.type,
    this.hsn,
    this.tsn,
    this.vehicleTax,
    this.purchasePrice,
    this.fuelType,
  });

  factory TechnicalData.fromJson(Map<String, dynamic> json) =>
      _$TechnicalDataFromJson(json);

  final int? id;
  final String? type;
  final String? hsn;
  final String? tsn;
  final double? vehicleTax;
  final double? purchasePrice;
  final List<FuelType>? fuelType;

  Map<String, dynamic> toJson() => _$TechnicalDataToJson(this);

  TechnicalData copyWith({
    int? id,
    String? brand,
    String? model,
    String? type,
    String? hsn,
    String? tsn,
    double? vehicleTax,
    double? purchasePrice,
    List<FuelType>? fuelType,
  }) =>
      TechnicalData(
        id: id ?? this.id,
        type: type ?? this.type,
        hsn: hsn ?? this.hsn,
        tsn: tsn ?? this.tsn,
        vehicleTax: vehicleTax ?? this.vehicleTax,
        purchasePrice: purchasePrice ?? this.purchasePrice,
        fuelType: fuelType ?? this.fuelType,
      );

  @override
  List<Object?> get props => <Object?>[
        id,
        type,
        hsn,
        tsn,
        vehicleTax,
        purchasePrice,
        fuelType,
      ];
}
