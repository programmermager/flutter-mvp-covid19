import 'package:covid19/model/object/covid_daily.dart';
import 'package:covid19/res/colors.dart';
import 'package:covid19/res/string.dart';
import 'package:covid19/screens/main/view/item_daily_update.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DailyUpdateView extends StatelessWidget {
  List<CovidDaily> daily = List();

  DailyUpdateView(this.daily);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
              left: ScreenUtil().setSp(15), right: ScreenUtil().setSp(15)),
          child: Text(
            Strings.daily_udpate,
            style: TextStyle(
                fontSize: ScreenUtil().setSp(14),
                fontFamily: "SansBold",
                color: Color(ColorsRes.bluedark)),
          ),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(10),
        ),
        Container(
          color: Color(ColorsRes.colorAccent),
          child: ListView.builder(
              reverse: true,
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: daily.length,
              itemBuilder: (context, index) {
                return ItemDailyUpdateView().show(context, daily[index]);
              }),
        )
      ],
    );
  }
}
