// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid_overview_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CovidOverviewResponse _$CovidOverviewResponseFromJson(
    Map<String, dynamic> json) {
  return CovidOverviewResponse()
    ..confirmed = json['confirmed'] == null
        ? null
        : CovidOverviewItem.fromJson(json['confirmed'] as Map<String, dynamic>)
    ..recovered = json['recovered'] == null
        ? null
        : CovidOverviewItem.fromJson(json['recovered'] as Map<String, dynamic>)
    ..deaths = json['deaths'] == null
        ? null
        : CovidOverviewItem.fromJson(json['deaths'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CovidOverviewResponseToJson(
        CovidOverviewResponse instance) =>
    <String, dynamic>{
      'confirmed': instance.confirmed,
      'recovered': instance.recovered,
      'deaths': instance.deaths,
    };
