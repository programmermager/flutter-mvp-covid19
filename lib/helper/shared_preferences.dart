import 'dart:convert';

import 'package:covid19/model/local_covid_daily.dart';
import 'package:covid19/model/object/covid_daily.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesProvider {
  static final SharedPreferencesProvider _singleton =
      SharedPreferencesProvider._internal();

  factory SharedPreferencesProvider() {
    return _singleton;
  }

  SharedPreferencesProvider._internal();

  saveDaily(List<CovidDaily> data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    LocalCovidDaily localData = LocalCovidDaily(data);
    await prefs.setString('daily', jsonEncode(localData));
  }

  Future<List<CovidDaily>> getDaily() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    LocalCovidDaily data = jsonDecode(prefs.getString("daily"));
    return data.data;
  }

  saveLastOtp(int timestamp) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('last_otp', timestamp);
  }

  Future<int> getLastOtp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("last_otp");
  }

  saveUserPhone(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('phone_user', value);
  }

  Future<String> getUserPhone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("phone_user");
  }
}
