import 'package:covid19/helper/global_helper.dart';
import 'package:covid19/model/chart_model.dart';
import 'package:covid19/model/response/covid_overview_response.dart';
import 'package:covid19/res/colors.dart';
import 'package:covid19/res/string.dart';
import 'package:covid19/screens/detail_status/detail_status_page.dart';
import 'package:covid19/widget/gauge_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatisticView extends StatelessWidget {
  CovidOverviewResponse data;
  List<ChartModel> charts = List();
  int totalReport = 0;

  StatisticView(this.charts, this.totalReport, this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(ScreenUtil().setSp(15)),
      child: Card(
        color: Color(ColorsRes.colorAccent),
        child: Padding(
          padding: EdgeInsets.all(ScreenUtil().setSp(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(
                    width: ScreenUtil().setWidth(200),
                    height: ScreenUtil().setHeight(200),
                    child: Stack(
                      children: <Widget>[
                        GaugeChart.setdata(charts),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                GlobalHelper().numberFormat(totalReport),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenUtil().setSp(16),
                                    fontFamily: "SansRegular"),
                              ),
                              Text(
                                "Cases reported",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: ScreenUtil().setSp(12),
                                    fontFamily: "SansRegular"),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailStatusPage(Strings.comfirmed)),
                            );
                          },
                          child: Column(
                            children: <Widget>[
                              Text(
                                  data != null
                                      ? GlobalHelper()
                                          .numberFormat(data.confirmed.value)
                                      : "0",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: ScreenUtil().setSp(16),
                                      fontFamily: "SansRegular")),
                              Text(Strings.comfirmed,
                                  style: TextStyle(
                                      color: Color(ColorsRes.confirmed),
                                      fontSize: ScreenUtil().setSp(12),
                                      fontFamily: "SansBold")),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(15),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailStatusPage(Strings.recovered)),
                            );
                          },
                          child: Column(
                            children: <Widget>[
                              Text(
                                  data != null
                                      ? GlobalHelper()
                                          .numberFormat(data.recovered.value)
                                      : "0",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: ScreenUtil().setSp(16),
                                      fontFamily: "SansRegular")),
                              Text(Strings.recovered,
                                  style: TextStyle(
                                      color: Color(ColorsRes.recovered),
                                      fontSize: ScreenUtil().setSp(12),
                                      fontFamily: "SansBold"))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(15),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailStatusPage(Strings.deaths)),
                            );
                          },
                          child: Column(
                            children: <Widget>[
                              Text(
                                  data != null
                                      ? GlobalHelper()
                                          .numberFormat(data.deaths.value)
                                      : "0",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: ScreenUtil().setSp(16),
                                      fontFamily: "SansRegular")),
                              Text(Strings.deaths,
                                  style: TextStyle(
                                      color: Color(ColorsRes.deaths),
                                      fontSize: ScreenUtil().setSp(12),
                                      fontFamily: "SansBold")),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Text(
                Strings.desc_statistic,
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: "SansRegular",
                    fontSize: ScreenUtil().setSp(12)),
              ),
              Text(
                Strings.desc_statistic_2,
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: "SansRegular",
                    fontSize: ScreenUtil().setSp(12)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
