import 'package:covid19/model/chart_model.dart';
import 'package:covid19/model/object/covid_daily.dart';
import 'package:covid19/model/response/covid_overview_response.dart';
import 'package:covid19/res/colors.dart';
import 'package:covid19/screens/main/view/daily_updates.dart';
import 'package:covid19/screens/main/view/statistic_view.dart';
import 'package:covid19/widget/toolbar_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'main_contract.dart';
import 'main_presenter.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> implements MainView {
  MainPresenter presenter;
  bool isLoading = false;
  CovidOverviewResponse data;
  List<ChartModel> charts = List();
  List<CovidDaily> daily = List();
  int totalReport = 0;

  @override
  void initState() {
    super.initState();
    presenter = MainPresenter(this);
    presenter?.getDashboard();
    presenter?.getDaily();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 360, height: 640, allowFontScaling: true)
          ..init(context);

    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(ColorsRes.colorPrimary),
          appBar: ToolbarHome(height: 55),
          body: isLoading
              ? _showLoading()
              : ListView(
                  children: <Widget>[
                    StatisticView(charts, totalReport, data),
                    DailyUpdateView(daily)
                  ],
                )),
    );
  }

  _showLoading() {
    return Container(
      child: CircularProgressIndicator(),
    );
  }

  @override
  void dismissLoading() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  void loading() {
    setState(() {
      isLoading = true;
    });
  }

  @override
  void getError(int code, String message) {}

  @override
  void getSuccess(CovidOverviewResponse response) {
    data = response;
    charts.clear();
    charts.add(
        ChartModel(data.confirmed.value, "Confirmed", ColorsRes.confirmed));
    charts.add(
        ChartModel(data.recovered.value, "Recovered", ColorsRes.recovered));
    charts.add(ChartModel(data.deaths.value, "Deaths", ColorsRes.deaths));

    totalReport =
        data.recovered.value + data.confirmed.value + data.deaths.value;

    setState(() {});
  }

  @override
  void getDailySuccess(List<CovidDaily> response) {
    daily.addAll(response);
    setState(() {});
  }
}
