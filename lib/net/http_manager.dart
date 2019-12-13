import 'dart:collection';

import 'package:dio/dio.dart';

import 'http_code.dart';
import 'http_data.dart';
import 'interceptors/error_interceptors.dart';
import 'interceptors/header_interceptor.dart';
import 'interceptors/response_interceptors.dart';

class HttpManager {
  Dio _dio = new Dio();

  HttpManager() {
    _dio.interceptors.add(HeaderInterceptor());
    _dio.interceptors.add(LogInterceptor());
    _dio.interceptors.add(ErrorInterceptors(_dio));
//    _dio.interceptors.add(ResponseInterceptors());
  }

//   *发起网络请求
//   *  [ url] 请求url
//   *  [ url] 请求url
//   *  [ params] 请求参数
//   *  [ header] 外加头
//   *  [ option] 配置

  Future<HttpData> fetchNet(
      url, params, Map<String, dynamic> header, Options option,
      {noTip = false}) async {
    Map<String, dynamic> headers = HashMap();
    if (header != null) {
      headers.addAll(header);
    }
    if (option != null) {
      option.headers = headers;
    } else {
      option = new Options(method: "get");
      option.headers = headers;
    }

    resultError(DioError e) {
      Response errorResponse;
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        errorResponse = new Response(statusCode: 666);
      }
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        errorResponse.statusCode = HttpCode.NETWORK_TIMEOUT;
      }
      return new HttpData(errorResponse.statusCode, e.message, '');
    }

    Response response;
    try {
      response = await _dio.request(url, data: params, options: option);
    } on DioError catch (e) {
      return resultError(e);
    }
    if (response.data is DioError) {
      return resultError(response.data);
    }
    return response.data;
  }
}

final HttpManager httpManager = new HttpManager();
