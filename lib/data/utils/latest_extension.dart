import 'package:exchange_app/data/entity/external/latest.dart';
import 'package:exchange_app/data/entity/internal/rate_info.dart';

import 'currency_utils.dart';

extension LatestExtension on Latest {
  List<RateInfo> toRateInfoList() {
    assert(rates.isNotEmpty, 'Rates map cannot be empty');
    return _buildRateInfoList();
  }

  ///You can easily implement more currencies here if you provide name and symbol
  List<RateInfo> _buildRateInfoList() => List<RateInfo>()
    ..add(RateInfo(
        usd,
        usdSymbol,
        _toStringAsFixedTwoDigits(rates[usd]),
        _timesTen(rates[usd]),
        _timesHundred(rates[usd]),
        _timesThousand(rates[usd])))
    ..add(RateInfo(
        cad,
        cadSymbol,
        _toStringAsFixedTwoDigits(rates[cad]),
        _timesTen(rates[cad]),
        _timesHundred(rates[cad]),
        _timesThousand(rates[cad])))
    ..add(RateInfo(
        gbp,
        gbpSymbol,
        _toStringAsFixedTwoDigits(rates[gbp]),
        _timesTen(rates[gbp]),
        _timesHundred(rates[gbp]),
        _timesThousand(rates[gbp])))
    ..add(RateInfo(
        jpy,
        jpySymbol,
        _toStringAsFixedTwoDigits(rates[jpy]),
        _timesTen(rates[jpy]),
        _timesHundred(rates[jpy]),
        _timesThousand(rates[jpy])))
    ..add(RateInfo(
        thb,
        thbSymbol,
        _toStringAsFixedTwoDigits(rates[thb]),
        _timesTen(rates[thb]),
        _timesHundred(rates[thb]),
        _timesThousand(rates[thb])))
    ..add(RateInfo(
        eur,
        eurSymbol,
        _toStringAsFixedTwoDigits(rates[eur]),
        _timesTen(rates[eur]),
        _timesHundred(rates[eur]),
        _timesThousand(rates[eur])));

  String _timesTen(double value) => _toStringAsFixedTwoDigits(value * 10.0);

  String _timesHundred(double value) =>
      _toStringAsFixedTwoDigits(value * 100.0);

  String _timesThousand(double value) =>
      _toStringAsFixedTwoDigits(value * 1000.0);

  String _toStringAsFixedTwoDigits(double value) => value.toStringAsFixed(2);
}
