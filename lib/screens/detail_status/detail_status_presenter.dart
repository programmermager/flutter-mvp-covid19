import 'package:covid19/data/remote/api_service.dart';
import 'package:covid19/model/object/covid_detail.dart';
import 'package:covid19/res/constant.dart';
import 'package:covid19/res/string.dart';
import 'package:covid19/screens/detail_status/detail_status_contract.dart';
import 'package:dio/dio.dart';

class DetailStatusPresenter implements DetailStatusInteractor {
  DetailStatusView view;

  DetailStatusPresenter(this.view);

  static var dio = Dio();

  @override
  void destroy() => view = null;

  @override
  void getConfirmed() async {
    dio.interceptors.add(LogInterceptor(responseBody: true));
    RestClient api = RestClient(dio);
    view?.loading();
    await api.confirmed().then((it) {
      view?.dismissLoading();
      if (it.length != null) {
        view?.getSuccess(it);
      } else {
        view?.getError(Constant.REQ_STATUS, Strings.failed_req);
      }
    }).catchError((e) {
      view?.dismissLoading();
      view?.getError(Constant.REQ_STATUS, Strings.failed_req);
    });
  }

  @override
  void getDeaths() async {
    dio.interceptors.add(LogInterceptor(responseBody: true));
    RestClient api = RestClient(dio);
    view?.loading();
    await api.deaths().then((it) {
      view?.dismissLoading();
      if (it.length != null) {
        view?.getSuccess(it);
      } else {
        view?.getError(Constant.REQ_STATUS, Strings.failed_req);
      }
    }).catchError((e) {
      view?.dismissLoading();
      view?.getError(Constant.REQ_STATUS, Strings.failed_req);
    });
  }

  @override
  void getRecovered() async {
    dio.interceptors.add(LogInterceptor(responseBody: true));
    RestClient api = RestClient(dio);
    view?.loading();
    await api.recovered().then((it) {
      view?.dismissLoading();
      if (it.length != null) {
        view?.getSuccess(it);
      } else {
        view?.getError(Constant.REQ_STATUS, Strings.failed_req);
      }
    }).catchError((e) {
      view?.dismissLoading();
      view?.getError(Constant.REQ_STATUS, Strings.failed_req);
    });
  }

  @override
  void searchCountry(String q, List<CovidDetail> data) {
    List<CovidDetail> filteredData = List<CovidDetail>();

    if(q != ""){
      data.forEach((element) {
        if (element.countryRegion.toLowerCase().contains(q.toLowerCase())) {
          filteredData.add(element);
        }
      });
    }else{
      filteredData.addAll(data);
    }

    view?.resultSearch(filteredData);
  }
}
