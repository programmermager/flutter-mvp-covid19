import 'package:intl/intl.dart';

class GlobalHelper {
  static final GlobalHelper _singleton = GlobalHelper._internal();

  factory GlobalHelper() {
    return _singleton;
  }

  GlobalHelper._internal();

  int getCurrentTimestamp() {
    return new DateTime.now().millisecondsSinceEpoch;
  }

  String numberFormat(int value) {
    return NumberFormat("#,###").format(value);
  }

  String formatTimestamp(int timestamp, String outpuFormat) {
    var format = new DateFormat(outpuFormat);
    var date = new DateTime.fromMillisecondsSinceEpoch(timestamp);
    return format.format(date);
  }
}
