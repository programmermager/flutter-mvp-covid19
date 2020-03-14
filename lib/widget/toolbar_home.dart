import 'package:flutter/material.dart';
import 'package:covid19/res/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math';

import 'dot_type.dart';

class ToolbarHome extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const ToolbarHome({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Color(ColorsRes.colorPrimary),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: ScreenUtil().setSp(15), top: ScreenUtil().setHeight(15)),
            child: Image.asset("assets/img/img_covid_logo.png", width: ScreenUtil().setWidth(150)),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}