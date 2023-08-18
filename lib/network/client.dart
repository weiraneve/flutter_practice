import "package:dio/dio.dart";

import '../common/config.dart';
import '../common/constants.dart';
import "dio_interceptor.dart";

class DioClient {
  static DioClient? _dioClient;
  static late Dio _dio;

  factory DioClient() {
    _dioClient ??= DioClient._internal();
    return _dioClient!;
  }

  DioClient._internal() {
    var cfg = Config();
    _dio = Dio(
      BaseOptions(
        baseUrl: cfg.get(baseUrl),
        connectTimeout:
            Duration(milliseconds: int.parse(cfg.get(connectTimeout))),
        receiveTimeout:
            Duration(milliseconds: int.parse(cfg.get(receiveTimeout))),
        responseType: ResponseType.json,
      ),
    );
    _dio.interceptors.add(DioInterceptor());
  }

  Dio get dio => _dio;

  void dispose() {
    _dio.close();
  }
}
