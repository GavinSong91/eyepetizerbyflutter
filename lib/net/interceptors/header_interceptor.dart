import 'package:dio/dio.dart';

class HeaderInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async{
    ///超时
    options.connectTimeout = 15 * 1000;
    return options;
  }
}
