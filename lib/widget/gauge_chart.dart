import 'dart:math';

import 'package:covid19/model/chart_model.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GaugeChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  GaugeChart(this.seriesList, {this.animate});

  /// Creates a [PieChart] with sample data and no transition.
  factory GaugeChart.setdata(List<ChartModel> data) {
    return new GaugeChart(
      _setData(data),
      // Disable animations for image tests.
      animate: true,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: charts.PieChart(seriesList,
          animate: animate,
          // Configure the width of the pie slices to 30px. The remaining space in
          // the chart will be left as a hole in the center. Adjust the start
          // angle and the arc length of the pie so it resembles a gauge.
          defaultRenderer: new charts.ArcRendererConfig(
            arcWidth: 20, )),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<ChartModel, String>> _setData(List<ChartModel> data) {
    return [
      new charts.Series<ChartModel, String>(
        id: 'Segments',
        colorFn: (ChartModel segment, _) => charts.ColorUtil.fromDartColor(Color(segment.color)),
        domainFn: (ChartModel segment, _) => segment.name,
        measureFn: (ChartModel segment, _) => segment.value,
        data: data,
      )
    ];
  }
}