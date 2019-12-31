import 'package:dio/dio.dart';

class HeaderInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async{
    ///超时
    options.connectTimeout = 15 * 1000;
    options.headers["User-Agent"] =
    "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36";
    return options;
  }
}
