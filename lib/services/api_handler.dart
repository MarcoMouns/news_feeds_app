import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class ApiHandler {
  Dio _api;

  ApiHandler() {
    _api = Dio();
    log('----------------------');
    log('Api Url: baseUrl');
    log('----------------------');
  }

  //Normal API Request
  Future<Response> request(
      {String url,
      HttpMethod method = HttpMethod.GET,
      Map<String, dynamic> headersData}) async {
    final String _method = method.toString().split('.')[1];

    try {
      _printRequest(_method, url, {}, {}, {});
    } catch (e) {}

    try {
      final Response _response = await _api.request(url,
          options: Options(
              method: _method,
              headers: {'Content-Type': 'application/json'},
              responseType: ResponseType.json));

      if (_response.statusCode == 401) {
        throw "unauthorized";
      } else if (_response != null && _response.data != null) {
        _printSuccess(_method, url, _response);
        return _response;
      } else if (_response.statusCode == 500) {
        throw 'something_went_wrong';
      }
    } on DioError catch (error) {
      if (error.type == DioErrorType.connectTimeout ||
          error.type == DioErrorType.sendTimeout ||
          error.type == DioErrorType.receiveTimeout ||
          error.type == DioErrorType.other ||
          error.type == DioErrorType.cancel) {
        log("no_internet_connection");
        throw 'no_internet_connection';
      }

      final int statusCode = error.response.statusCode;
      if (error.response != null && error.response.statusCode != 404) {
        _printError(_method, url, error.response.data.toString(), statusCode,
            error.response.data.toString());
        if ((statusCode == 401)) {
          throw "unauthorized";
        }
        return error.response;
      } else if ((statusCode == 401)) {
        throw "unauthorized";
      } else {
        _printError(_method, url, error.message);
        if (error.type == DioErrorType.connectTimeout ||
            error.type == DioErrorType.sendTimeout ||
            error.type == DioErrorType.receiveTimeout ||
            error.type == DioErrorType.other ||
            error.type == DioErrorType.cancel) {
          log("no_internet_connection");
          throw 'no_internet_connection';
        }
        throw error.message;
      }
    } catch (error) {
      log(error.toString() + " error api handler ");
      return null;
    }
  }

  void _printRequest(
    String method,
    String url,
    Map<String, dynamic> headers,
    dynamic data,
    Map<String, dynamic> query,
  ) {
    log('----------------------');
    log('$method $url Request.');
    if (data != null) {
      log('==> Data : ${json.encode(data)}');
    }
    if (query != null) {
      log('==> Query : $query');
    }
    log('==> headers : ${headers.toString()}');
    log('----------------------');
  }

  void _printSuccess(String method, String url, Response response) {
    log('----------------------');
    log('$method $url Success.');
    log('==> Body : ${json.encode(response.data)}');
    log('==> Status Code : ${response.statusCode}');
    log('----------------------');
  }

  void _printError(
    String method,
    String url,
    String error, [
    int statusCode,
    dynamic modelState,
  ]) {
    log('----------------------');
    log('$method $url Error.');
    log('==> Message : $error');
    if (statusCode != null) {
      log('==> Status Code : $statusCode');
    }
    if (modelState != null) {
      log('==> Model State : ${json.encode(modelState)}');
    }
    log('----------------------');
  }
}

enum HttpMethod { GET, POST, PUT, DELETE }
