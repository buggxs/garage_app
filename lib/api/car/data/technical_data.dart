import 'package:equatable/equatable.dart';
import 'package:garage_app/components/car/i18n/car_i18n.dart';
import 'package:garage_app/components/car/i18n/car_text.dart';
import 'package:json_annotation/json_annotation.dart';

part 'technical_data.g.dart';

enum FuelType {
  @JsonValue('diesel')
  diesel,
  @JsonValue('patrol')
  petrol,
  @JsonValue('electric')
  electric,
}

extension FuelTypeExtension on FuelType {
  static final Map<FuelType, String> _fuelTypeMap = <FuelType, String>{
    FuelType.diesel: CarText.diesel(),
    FuelType.electric: CarText.electric(),
    FuelType.petrol: CarText.patrol()
  };

  String get fuelTypeString {
    return _fuelTypeMap[this] ?? '';
  }
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
    this.fuelType = const <FuelType>[],
  });

  factory TechnicalData.fromJson(Map<String, dynamic> json) =>
      _$TechnicalDataFromJson(json);

  final int? id;
  final String? type;
  final String? hsn;
  final String? tsn;
  final double? vehicleTax;
  final double? purchasePrice;
  final List<FuelType> fuelType;

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

  String get fuelTypeList =>
      fuelType.map((FuelType ft) => ft.fuelTypeString).join(', ');

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
