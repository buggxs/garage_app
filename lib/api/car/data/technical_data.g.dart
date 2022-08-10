// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'technical_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TechnicalData _$TechnicalDataFromJson(Map<String, dynamic> json) =>
    TechnicalData(
      id: json['id'] as int,
      type: json['type'] as String?,
      hsn: json['hsn'] as String?,
      tsn: json['tsn'] as String?,
    );

Map<String, dynamic> _$TechnicalDataToJson(TechnicalData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'hsn': instance.hsn,
      'tsn': instance.tsn,
    };
