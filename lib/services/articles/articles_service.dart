import 'package:dio/dio.dart';
import 'package:link_dev/utils/api_routes.dart';

import '../api_handler.dart';

class ArticlesService {
  final _api = ApiHandler();

  Future<Response> getArticlesList1() async {
    return _api
        .request(method: HttpMethod.GET, url: ApiRoutes.getArticlesList1)
        .catchError((error) {
      if (error.toString() == "no_internet_connection") {
        throw "no_internet_connection";
      } else if (error.toString() == "something_went_wrong") {
        throw "something_went_wrong";
      }
    });
  }

  Future<Response> getArticlesList2() async {
    return _api
        .request(method: HttpMethod.GET, url: ApiRoutes.getArticlesList2)
        .catchError((error) {
      if (error.toString() == "no_internet_connection") {
        throw "no_internet_connection";
      } else if (error.toString() == "something_went_wrong") {
        throw "something_went_wrong";
      }
    });
  }
}
