import 'package:json_annotation/json_annotation.dart';

part 'covid_overview_item.g.dart';

@JsonSerializable()
class CovidOverviewItem {
  String detail;
  int value;

  CovidOverviewItem();

  factory CovidOverviewItem.fromJson(Map<String, dynamic> json) =>
      _$CovidOverviewItemFromJson(json);

  Map<String, dynamic> toJson() => _$CovidOverviewItemToJson(this);
}
