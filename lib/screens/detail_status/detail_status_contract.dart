import 'package:covid19/model/object/covid_detail.dart';

class DetailStatusInteractor {
  void getConfirmed() {}

  void getDeaths() {}

  void getRecovered() {}

  void searchCountry(String q, List<CovidDetail> data) {}
}

class DetailStatusView {
  void getSuccess(List<CovidDetail> response) {}

  void getError(int code, String message) {}

  void resultSearch(List<CovidDetail> data) {}

  void loading() {}

  void dismissLoading() {}
}
