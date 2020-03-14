import 'package:covid19/model/object/covid_daily.dart';
import 'package:covid19/model/object/covid_detail.dart';
import 'package:covid19/model/response/covid_overview_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://covid19.mathdro.id/")
abstract class RestClient{

  factory RestClient(Dio dio) = _RestClient;

  @GET("api")
  Future<CovidOverviewResponse> overview();

  @GET("api/daily")
  Future<List<CovidDaily>> daily();

  @GET("api/confirmed")
  Future<List<CovidDetail>> confirmed();

  @GET("api/deaths")
  Future<List<CovidDetail>> deaths();

  @GET("api/recovered")
  Future<List<CovidDetail>> recovered();


}
