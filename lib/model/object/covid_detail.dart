import 'package:json_annotation/json_annotation.dart';

part 'covid_detail.g.dart';

@JsonSerializable()
class CovidDetail {
  int confirmed;
  String countryRegion;
  int deaths;
  int lastUpdate;
  double lat;
  double long;
  String provinceState;
  int recovered;

  CovidDetail();

  factory CovidDetail.fromJson(Map<String, dynamic> json) =>
      _$CovidDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CovidDetailToJson(this);
}
