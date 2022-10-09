// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oil_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OilData _$OilDataFromJson(Map<String, dynamic> json) => OilData(
      id: json['id'] as int?,
      lastChangeMileage: (json['lastChangeMileage'] as num?)?.toDouble(),
      lastChangeDate: json['lastChangeDate'] == null
          ? null
          : DateTime.parse(json['lastChangeDate'] as String),
      nextChangeMileage: (json['nextChangeMileage'] as num?)?.toDouble(),
      nextChangeDate: json['nextChangeDate'] == null
          ? null
          : DateTime.parse(json['nextChangeDate'] as String),
      oilBrand: json['oilBrand'] as String?,
      oilType: json['oilType'] as String?,
    );

Map<String, dynamic> _$OilDataToJson(OilData instance) => <String, dynamic>{
      'id': instance.id,
      'oilBrand': instance.oilBrand,
      'oilType': instance.oilType,
      'lastChangeDate': instance.lastChangeDate?.toIso8601String(),
      'lastChangeMileage': instance.lastChangeMileage,
      'nextChangeDate': instance.nextChangeDate?.toIso8601String(),
      'nextChangeMileage': instance.nextChangeMileage,
    };
