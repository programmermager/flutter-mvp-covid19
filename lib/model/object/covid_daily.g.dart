// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid_daily.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CovidDaily _$CovidDailyFromJson(Map<String, dynamic> json) {
  return CovidDaily()
    ..deltaConfirmed = json['deltaConfirmed'] as int
    ..deltaRecovered = json['deltaRecovered'] as int
    ..mainlandChina = json['mainlandChina'] as int
    ..objectid = json['objectid'] as int
    ..otherLocations = json['otherLocations'] as int
    ..reportDate = json['reportDate'] as int
    ..reportDateString = json['reportDateString'] as String
    ..totalConfirmed = json['totalConfirmed'] as int
    ..totalRecovered = json['totalRecovered'] as int
    ..incrementRecovered = json['incrementRecovered'] as int
    ..incrementConfirmed = json['incrementConfirmed'] as int;
}

Map<String, dynamic> _$CovidDailyToJson(CovidDaily instance) =>
    <String, dynamic>{
      'deltaConfirmed': instance.deltaConfirmed,
      'deltaRecovered': instance.deltaRecovered,
      'mainlandChina': instance.mainlandChina,
      'objectid': instance.objectid,
      'otherLocations': instance.otherLocations,
      'reportDate': instance.reportDate,
      'reportDateString': instance.reportDateString,
      'totalConfirmed': instance.totalConfirmed,
      'totalRecovered': instance.totalRecovered,
      'incrementRecovered': instance.incrementRecovered,
      'incrementConfirmed': instance.incrementConfirmed,
    };
