import 'dart:async';

import 'package:exchange_app/app/utils/bloc_provider.dart';
import 'package:exchange_app/data/entity/internal/rate_info.dart';
import 'package:exchange_app/data/network/exchange_rate_api.dart';
import 'package:exchange_app/data/utils/currency_utils.dart';
import 'package:exchange_app/data/utils/latest_extension.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BlocBase {
  static const baseCurrencies = [usd, cad, gbp, jpy, thb, eur];
  static const initialBarIndex = 2;
  static const initialCardIndex = 3;

  final _exchangeRateApi = ExchangeRateApi.instance;

  final _rateInfoListSubject = BehaviorSubject<List<RateInfo>>();
  final _currentRateInfoIndexSubject = BehaviorSubject.seeded(initialCardIndex);
  final _currentCurrencyBaseIndexSubject =
      BehaviorSubject.seeded(initialBarIndex);

  Stream get rateInfoList => _rateInfoListSubject.stream;

  Stream get currentRateInfoIndex => _currentRateInfoIndexSubject.stream;

  Stream get currentCurrencyBaseIndex =>
      _currentCurrencyBaseIndexSubject.stream;

  StreamSink<int> get currentRateInfoIndexSink =>
      _currentRateInfoIndexSubject.sink;

  StreamSink<int> get currentCurrencyBaseIndexSink =>
      _currentCurrencyBaseIndexSubject.sink;

  HomeBloc() {
    _subscribeToCurrentCurrencyBaseIndexSubject();
    getInitialRateInfoList();
  }

  _subscribeToCurrentCurrencyBaseIndexSubject() =>
      _currentCurrencyBaseIndexSubject.listen(_requestRateInfoList);

  _requestRateInfoList(int baseIndex) async {
    try {
      var initialLatestList =
          await _exchangeRateApi.getLatest(baseCurrencies[baseIndex]);
      var initialRateInfoList = initialLatestList.toRateInfoList();
      _rateInfoListSubject.add(initialRateInfoList);
    } catch (e) {
      _rateInfoListSubject.addError(e);
    }
  }

  getInitialRateInfoList() {
    _rateInfoListSubject.add(null);
    _requestRateInfoList(initialBarIndex);
  }

  @override
  dispose() {
    _rateInfoListSubject.close();
    _currentRateInfoIndexSubject.close();
    _currentCurrencyBaseIndexSubject.close();
  }
}
