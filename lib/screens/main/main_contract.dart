import 'package:covid19/model/object/covid_daily.dart';
import 'package:covid19/model/response/covid_overview_response.dart';

class MainInteractor {
  void getDashboard() {}

  void getDaily() {}

  void destroy() {}
}

class MainView {
  void getSuccess(CovidOverviewResponse response) {}

  void getDailySuccess(List<CovidDaily> response) {}

  void getError(int code, String message) {}

  void loading() {}

  void dismissLoading() {}
}
