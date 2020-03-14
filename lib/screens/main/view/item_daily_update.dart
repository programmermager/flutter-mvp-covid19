import 'package:covid19/helper/global_helper.dart';
import 'package:covid19/model/object/covid_daily.dart';
import 'package:covid19/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemDailyUpdateView {
  Widget show(BuildContext context, CovidDaily data,
      {Function onDelete(String id, bool isParent), Function onReply}) {
    return Column(
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(top: ScreenUtil().setSp(25),left: ScreenUtil().setSp(15), right: ScreenUtil().setSp(15)),
            width: MediaQuery.of(context).size.width,
            child:  Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Icon(
                    Icons.access_time,
                    color: Color(ColorsRes.bluedark),
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(15),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        GlobalHelper().formatTimestamp(data.reportDate, "dd MMMM yyyy"),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(12),
                            fontFamily: "SansRegular"),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(5),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text(
                            "Confirmed  ${data.deltaConfirmed != null ? GlobalHelper().numberFormat(data.deltaConfirmed) : 0}",
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(12),
                                fontFamily: "SansBold",
                                color: Color(ColorsRes.confirmed)),
                          ),
                          SizedBox(
                            width: ScreenUtil().setWidth(15),
                          ),
                          Text(
                            "Recovered ${data.deltaRecovered != null ? GlobalHelper().numberFormat(data.deltaRecovered) : 0}",
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(12),
                                fontFamily: "SansBold",
                                color: Color(ColorsRes.recovered)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(5),
                      ),
                      Text(
                        "Total ${GlobalHelper().numberFormat(data.mainlandChina)} cases on Chine and ${GlobalHelper().numberFormat(data.otherLocations)} on the other locations",
                        style: TextStyle(
                            fontFamily: "SansRegular",
                            fontSize: ScreenUtil().setSp(12),
                            color: Colors.grey),
                      )
                    ],
                  ),
                )
              ],
            ),
        ),
        SizedBox(height: ScreenUtil().setHeight(10),),
        Divider(
          color: Colors.black,
        )
      ],
    );
  }
}
