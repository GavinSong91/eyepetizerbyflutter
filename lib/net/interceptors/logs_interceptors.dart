import 'package:dio/dio.dart';
import 'package:eyepetizer/common/config.dart';

class LogsInterceptors extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    if (Config.isDebuge) {
      print("====================onRequest====================");
      print("==请求url：${options.path}");
      print('==请求头：${options.headers.toString()}');
      if (options.data != null) {
        print('==请求参数: ' + options.data.toString());
      }
      print("====================onRequest====================");
    }
    return options;
  }

  @override
  onResponse(Response response) async {
    if (Config.isDebuge) {
      if (response != null) {
        print("====================onResponse====================");
        print('==返回参数:${response.toString()}');
        print("====================onResponse====================");
      }
    }
    return response;
  }

  @override
  onError(DioError err) async {
    if (Config.isDebuge) {
      print("====================onError====================");
      print('==请求异常: ${err.toString()}');
      print('==请求异常信息: ${err.response?.toString() ?? ""}');
      print("====================onError====================");
    }
    return err;
  }
}
