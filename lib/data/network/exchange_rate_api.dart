import 'package:dio/dio.dart';
import 'package:exchange_app/data/entity/external/latest.dart';
import 'package:exchange_app/data/network/base_api.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ExchangeRateApi extends BaseApi {
  static final ExchangeRateApi instance = ExchangeRateApi._internal();

  static const _timeout = 10000; //10s

  static const _endPoint = 'https://api.exchangeratesapi.io';
  static const _latestBase = '/latest?base=';

  ExchangeRateApi._internal() : super(_endPoint);

  @override
  Dio configureDio() => Dio()
    ..interceptors.add(PrettyDioLogger())
    ..options.connectTimeout = _timeout;

  Future<Latest> getLatest(String base) async {
    assert(base.isNotEmpty, "Base cannot be empty");
    var result = await get("$_latestBase$base");
    return Latest.fromJson(result.data);
  }
}
