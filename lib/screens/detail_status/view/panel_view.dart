import 'package:covid19/helper/global_helper.dart';
import 'package:covid19/model/object/covid_detail.dart';
import 'package:covid19/res/colors.dart';
import 'package:covid19/res/string.dart';
import 'package:covid19/screens/detail_status/view/item_status_country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PanelView {
  Widget show(ScrollController sc, BuildContext context, String status,
      List<CovidDetail> data,
      {Function onSearch(String value), Function onClick(CovidDetail data)}) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          controller: sc,
          children: <Widget>[
            SizedBox(
              height: ScreenUtil().setHeight(12),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(20),
                  height: ScreenUtil().setHeight(3),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(3),
                ),
                Container(
                  width: ScreenUtil().setWidth(20),
                  height: ScreenUtil().setHeight(3),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                ),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(15)),
            Container(
              margin: EdgeInsets.only(
                  left: ScreenUtil().setWidth(15),
                  right: ScreenUtil().setWidth(15)),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: ScreenUtil().setSp(10),
                    right: ScreenUtil().setSp(10)),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                    Expanded(
                      flex: 9,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Type city or province Region ...",
                            border: InputBorder.none,
                            fillColor: Colors.grey),
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          onSearch(value);
                        },
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(12),
                            color: Colors.white,
                            fontFamily: 'SansRegular'),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(15)),
            Container(
              margin: EdgeInsets.only(
                  left: ScreenUtil().setWidth(15),
                  right: ScreenUtil().setWidth(15)),
              color: Color(ColorsRes.colorAccent),
              child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    String value;
                    if (status == Strings.comfirmed) {
                      value =
                          GlobalHelper().numberFormat(data[index].confirmed);
                    } else if (status == Strings.recovered) {
                      value =
                          GlobalHelper().numberFormat(data[index].recovered);
                    } else {
                      value = GlobalHelper().numberFormat(data[index].deaths);
                    }

                    return ItemStatusCountry().show(
                        context, data[index], status, value,
                        onClick: (CovidDetail data) => onClick(data));
                  }),
            )
          ],
        ));
  }
}
