// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CovidDetail _$CovidDetailFromJson(Map<String, dynamic> json) {
  return CovidDetail()
    ..confirmed = json['confirmed'] as int
    ..countryRegion = json['countryRegion'] as String
    ..deaths = json['deaths'] as int
    ..lastUpdate = json['lastUpdate'] as int
    ..lat = (json['lat'] as num)?.toDouble()
    ..long = (json['long'] as num)?.toDouble()
    ..provinceState = json['provinceState'] as String
    ..recovered = json['recovered'] as int;
}

Map<String, dynamic> _$CovidDetailToJson(CovidDetail instance) =>
    <String, dynamic>{
      'confirmed': instance.confirmed,
      'countryRegion': instance.countryRegion,
      'deaths': instance.deaths,
      'lastUpdate': instance.lastUpdate,
      'lat': instance.lat,
      'long': instance.long,
      'provinceState': instance.provinceState,
      'recovered': instance.recovered,
    };
