// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_conditioner_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirConditionerData _$AirConditionerDataFromJson(Map<String, dynamic> json) =>
    AirConditionerData(
      id: json['id'] as int?,
      lastChangeMileage: (json['lastChangeMileage'] as num?)?.toDouble(),
      lastChangeDate: json['lastChangeDate'] == null
          ? null
          : DateTime.parse(json['lastChangeDate'] as String),
      nextChangeMileage: (json['nextChangeMileage'] as num?)?.toDouble(),
      nextChangeDate: json['nextChangeDate'] == null
          ? null
          : DateTime.parse(json['nextChangeDate'] as String),
    );

Map<String, dynamic> _$AirConditionerDataToJson(AirConditionerData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lastChangeDate': instance.lastChangeDate?.toIso8601String(),
      'lastChangeMileage': instance.lastChangeMileage,
      'nextChangeDate': instance.nextChangeDate?.toIso8601String(),
      'nextChangeMileage': instance.nextChangeMileage,
    };
