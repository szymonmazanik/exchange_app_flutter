import 'package:dio/dio.dart';

abstract class BaseApi {
  final String _endPoint;

  Dio _dio;

  BaseApi(this._endPoint) {
    _dio = configureDio();
  }

  Dio configureDio();

  Future<Response> get(url) => _dio.get('$_endPoint$url');
}
