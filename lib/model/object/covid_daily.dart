import 'package:json_annotation/json_annotation.dart';

part 'covid_daily.g.dart';

@JsonSerializable()
class CovidDaily {
  int deltaConfirmed;
  int deltaRecovered;
  int mainlandChina;
  int objectid;
  int otherLocations;
  int reportDate;
  String reportDateString;
  int totalConfirmed;
  int totalRecovered;
  int incrementRecovered;
  int incrementConfirmed;


  CovidDaily();

  factory CovidDaily.fromJson(Map<String, dynamic> json) =>
      _$CovidDailyFromJson(json);

  Map<String, dynamic> toJson() => _$CovidDailyToJson(this);
}
