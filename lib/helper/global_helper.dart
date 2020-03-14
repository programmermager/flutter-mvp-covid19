import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';

class GlobalHelper {
  static final GlobalHelper _singleton = GlobalHelper._internal();

  factory GlobalHelper() {
    return _singleton;
  }

  GlobalHelper._internal();

  int getCurrentTimestamp() {
    return new DateTime.now().millisecondsSinceEpoch;
  }

  String numberFormat(int value){
    return NumberFormat("#,###").format(value);
  }

  showToast(String message, BuildContext context, int gravity) {
    Toast.show(message, context, duration: Toast.LENGTH_LONG, gravity: gravity);
  }

  showToastWithColor(String message, BuildContext context, int gravity,
      Color bgColor, Color txtColor) {
    Toast.show(message, context,
        duration: Toast.LENGTH_LONG,
        gravity: gravity,
        backgroundColor: bgColor,
        textColor: txtColor);
  }

  showSnackBar(String content, BuildContext context) {
    final snackBar = SnackBar(content: Text(content));
    Scaffold.of(context).showSnackBar(snackBar);
  }


  String formatTimestamp(int timestamp, String outpuFormat) {
    var format = new DateFormat(outpuFormat);
    var date = new DateTime.fromMillisecondsSinceEpoch(timestamp);
    return format.format(date);
  }

  DateTime formatTimestampToDate(int timestamp) {
//    var format = new DateFormat(outpuFormat);
    var date = new DateTime.fromMillisecondsSinceEpoch(timestamp);
    return date;
  }

  DateTime convertDateFormat(
      String inFormat, String outFormat, String inputDate) {
    DateFormat inputFormat = DateFormat(inFormat);
    DateTime dateTime = inputFormat.parse(inputDate);
    DateFormat outputFormat = DateFormat(outFormat);
    return outputFormat.parse(dateTime.toString());
  }

  checkInternetStatus(BuildContext context) async {
//    Navigator.pop(context);
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//        Navigator.pop(context);
      }
    } on SocketException catch (_) {
      GlobalHelper().showToastWithColor(
          "Please check your network seems disconnected",
          context,
          Toast.BOTTOM,
          Colors.red,
          Colors.white);
    }
  }
}
