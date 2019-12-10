import 'package:dio/dio.dart';

class HttpManager {
  Dio _dio = new Dio();

  HttpManager() {
//    _dio.interceptors.add(new HeaderInterceptors());
//    _dio.interceptors.add(new LogInterceptor());
//    _dio.interceptors.add(new ErrorInterceptors(_dio));
  }
}
