import 'dart:io';

import 'package:dio/dio.dart';

import '../http_code.dart';
import '../http_data.dart';

class ResponseInterceptors extends InterceptorsWrapper {
  @override
  @override
  onResponse(Response response) async {
    RequestOptions option = response.request;
    var value;
    try {
      var header = response.headers[HttpHeaders.contentTypeHeader];
      if ((header != null && header.toString().contains("text"))) {
        value = HttpData(
          HttpCode.SUCCESS,
          "请求成功",
          response.data,
        );
      } else if (response.statusCode >= 200 && response.statusCode < 300) {
        value = HttpData(
          HttpCode.SUCCESS,
          "请求成功",
          response.data,
        );
      }
    } catch (e) {
      print(e.toString() + option.path);
      value =  HttpData(
        HttpCode.NETWORK_ERROR,
        "",
        response.data,
      );
    }
    return response;
  }
}
