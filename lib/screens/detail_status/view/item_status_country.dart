import 'package:covid19/helper/global_helper.dart';
import 'package:covid19/model/object/covid_detail.dart';
import 'package:covid19/res/colors.dart';
import 'package:covid19/res/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemStatusCountry {
  Widget show(BuildContext context, CovidDetail data, String status, String value,
      {Function onClick(CovidDetail data)}) {
    return InkWell(
      onTap: (){
        onClick(data);
      },
      child: Container(
        margin: EdgeInsets.only(
            top: ScreenUtil().setSp(25),
            left: ScreenUtil().setSp(15),
            right: ScreenUtil().setSp(15)),
        width: MediaQuery.of(context).size.width,
        child: Row(
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
                    "${data?.countryRegion} ${data?.provinceState != null ? ", ${data?.provinceState}" : ""}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(12),
                        fontFamily: "SansRegular"),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(5),
                  ),
                  Text(
                    "$status $value",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(12),
                        fontFamily: "SansBold",
                        color: status == Strings.comfirmed ? Color(ColorsRes.confirmed) : status == Strings.deaths ? Color(ColorsRes.deaths) : Color(ColorsRes.recovered)),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(5),
                  ),
                  Text(
                    "Last update ${GlobalHelper().formatTimestamp(data?.lastUpdate, "dd MMMM yyyy")}",
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
    );
  }
}
