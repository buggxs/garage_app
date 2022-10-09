// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'technical_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TechnicalData _$TechnicalDataFromJson(Map<String, dynamic> json) =>
    TechnicalData(
      id: json['id'] as int?,
      type: json['type'] as String?,
      hsn: json['hsn'] as String?,
      tsn: json['tsn'] as String?,
      vehicleTax: (json['vehicleTax'] as num?)?.toDouble(),
      purchasePrice: (json['purchasePrice'] as num?)?.toDouble(),
      fuelType: (json['fuelType'] as List<dynamic>?)
              ?.map((dynamic e) => $enumDecode(_$FuelTypeEnumMap, e))
              .toList() ??
          const <FuelType>[],
    );

Map<String, dynamic> _$TechnicalDataToJson(TechnicalData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'hsn': instance.hsn,
      'tsn': instance.tsn,
      'vehicleTax': instance.vehicleTax,
      'purchasePrice': instance.purchasePrice,
      'fuelType':
          instance.fuelType.map((FuelType e) => _$FuelTypeEnumMap[e]!).toList(),
    };

const Map<FuelType, String> _$FuelTypeEnumMap = <FuelType, String>{
  FuelType.diesel: 'diesel',
  FuelType.petrol: 'patrol',
  FuelType.electric: 'electric',
};
