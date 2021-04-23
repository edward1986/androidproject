import 'package:dio/dio.dart';

class CustomDio {
  var _dio;

  CustomDio() {
    _dio = Dio(_options);
  }

  BaseOptions _options = BaseOptions(
    baseUrl: 'http://10.0.2.2:8080/api',
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );

  Dio get instance => _dio;
}
