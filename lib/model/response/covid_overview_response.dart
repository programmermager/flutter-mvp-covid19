import 'package:covid19/model/object/covid_overview_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'covid_overview_response.g.dart';

@JsonSerializable()
class CovidOverviewResponse {
  CovidOverviewItem confirmed;
  CovidOverviewItem recovered;
  CovidOverviewItem deaths;

  CovidOverviewResponse();

  factory CovidOverviewResponse.fromJson(Map<String, dynamic> json) =>
      _$CovidOverviewResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CovidOverviewResponseToJson(this);
}
