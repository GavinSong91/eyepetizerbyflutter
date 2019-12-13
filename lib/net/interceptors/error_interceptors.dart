import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';

import '../http_code.dart';
import '../http_data.dart';

class ErrorInterceptors extends InterceptorsWrapper {
  final Dio _dio;

  ErrorInterceptors(this._dio);

  @override
  onRequest(RequestOptions options) async {
    //没有网络
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return _dio.resolve(HttpData(HttpCode.NETWORK_ERROR, "无网络", ""));
    }
    return options;
  }
}
