// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brake_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrakeData _$BrakeDataFromJson(Map<String, dynamic> json) => BrakeData(
      id: json['id'] as int,
      lastChangeMileage: (json['lastChangeMileage'] as num?)?.toDouble(),
      lastChangeDate: json['lastChangeDate'] == null
          ? null
          : DateTime.parse(json['lastChangeDate'] as String),
      nextChangeMileage: (json['nextChangeMileage'] as num?)?.toDouble(),
      nextChangeDate: json['nextChangeDate'] == null
          ? null
          : DateTime.parse(json['nextChangeDate'] as String),
    );

Map<String, dynamic> _$BrakeDataToJson(BrakeData instance) => <String, dynamic>{
      'id': instance.id,
      'lastChangeMileage': instance.lastChangeMileage,
      'lastChangeDate': instance.lastChangeDate?.toIso8601String(),
      'nextChangeMileage': instance.nextChangeMileage,
      'nextChangeDate': instance.nextChangeDate?.toIso8601String(),
    };