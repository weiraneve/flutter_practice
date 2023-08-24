import "package:dio/dio.dart";

import '../common/config.dart';
import "../common/constants.dart";
import "dio_interceptor.dart";

class DioClient {
  static DioClient? _dioClient;
  static late Dio _dio;

  factory DioClient() {
    _dioClient ??= DioClient._internal();
    return _dioClient!;
  }

  DioClient._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: Env[baseUrlWanandroid] ?? '',
        connectTimeout: Duration(
            milliseconds: int.parse((Env[connectTimeout] ?? '10000'))),
        receiveTimeout: Duration(
            milliseconds: int.parse(Env[receiveTimeout] ?? '10000')),
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
