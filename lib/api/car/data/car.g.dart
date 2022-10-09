// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Car _$CarFromJson(Map<String, dynamic> json) => Car(
      id: json['id'] as int?,
      name: json['name'] as String?,
      brand: json['brand'] as String?,
      model: json['model'] as String?,
      mileage: (json['mileage'] as num?)?.toDouble(),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      vintage: json['vintage'] as int?,
      networkImages: (json['networkImages'] as List<String>?)
          ?.map((String e) => e)
          .toList(),
      oilData: json['oilData'] == null
          ? const OilData()
          : OilData.fromJson(json['oilData'] as Map<String, dynamic>),
      airConditioner: json['airConditioner'] == null
          ? const AirConditionerData()
          : AirConditionerData.fromJson(
              json['airConditioner'] as Map<String, dynamic>,
            ),
      brakeData: json['brakeData'] == null
          ? const BrakeData()
          : BrakeData.fromJson(json['brakeData'] as Map<String, dynamic>),
      timingBeltData: json['timingBeltData'] == null
          ? const TimingBeltData()
          : TimingBeltData.fromJson(
              json['timingBeltData'] as Map<String, dynamic>,
            ),
      technicalData: json['technicalData'] == null
          ? null
          : TechnicalData.fromJson(
              json['technicalData'] as Map<String, dynamic>,
            ),
      documentList: (json['documentList'] as List<List<Document>>?)
          ?.map(
            (List<Document> e) => e
                .map(
                  (Document e) => Document.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
          )
          .toList(),
      noteList: (json['noteList'] as List<Note>?)
          ?.map((Note e) => Note.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CarToJson(Car instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'brand': instance.brand,
      'model': instance.model,
      'mileage': instance.mileage,
      'date': instance.date?.toIso8601String(),
      'vintage': instance.vintage,
      'networkImages': instance.networkImages,
      'oilData': instance.oilData,
      'airConditioner': instance.airConditioner,
      'brakeData': instance.brakeData,
      'timingBeltData': instance.timingBeltData,
      'technicalData': instance.technicalData,
      'documentList': instance.documentList,
      'noteList': instance.noteList,
    };
