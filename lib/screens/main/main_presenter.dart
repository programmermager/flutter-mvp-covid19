import 'package:covid19/data/remote/api_service.dart';
import 'package:covid19/res/constant.dart';
import 'package:covid19/res/string.dart';
import 'package:dio/dio.dart';

import 'main_contract.dart';

class MainPresenter implements MainInteractor {
  MainView view;

  MainPresenter(this.view);

  static var dio = Dio();

  @override
  void destroy() => view = null;

  @override
  void getDashboard() async {
    dio.interceptors.add(LogInterceptor(responseBody: true));
    RestClient api = RestClient(dio);
    view?.loading();
    await api.overview().then((it) {
      view?.dismissLoading();
      if (it.confirmed != null) {
        view?.getSuccess(it);
      } else {
        view?.getError(Constant.REQ_OVERVIEW, Strings.failed_req);
      }
    }).catchError((e) {
      view?.dismissLoading();
      view?.getError(Constant.REQ_OVERVIEW, Strings.failed_req);
    });
  }

  @override
  void getDaily() async {
    dio.interceptors.add(LogInterceptor(responseBody: true));
    RestClient api = RestClient(dio);
    view?.loading();
    await api.daily().then((it) {
      view?.dismissLoading();
      if (it.length != null) {
        view?.getDailySuccess(it);
      } else {
        view?.getError(Constant.REQ_DAILY, Strings.failed_req);
      }
    }).catchError((e) {
      view?.dismissLoading();
      view?.getError(Constant.REQ_DAILY, Strings.failed_req);
    });
  }
}
