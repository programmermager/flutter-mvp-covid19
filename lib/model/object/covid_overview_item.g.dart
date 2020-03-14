// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid_overview_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CovidOverviewItem _$CovidOverviewItemFromJson(Map<String, dynamic> json) {
  return CovidOverviewItem()
    ..detail = json['detail'] as String
    ..value = json['value'] as int;
}

Map<String, dynamic> _$CovidOverviewItemToJson(CovidOverviewItem instance) =>
    <String, dynamic>{
      'detail': instance.detail,
      'value': instance.value,
    };
