import 'package:exchange_app/app/utils/app_colors.dart';
import 'package:exchange_app/app/utils/styles.dart';
import 'package:exchange_app/data/entity/internal/rate_info.dart';
import 'package:flutter/material.dart';

class ExchangeRateRendererWidget extends StatelessWidget {
  final double offset;
  final double cardWidth;
  final double cardHeight;
  final RateInfo rateInfo;

  ExchangeRateRendererWidget(this.offset,
      {Key key, this.cardWidth = 250, @required this.rateInfo, this.cardHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: cardWidth,
        child: Container(
          margin: EdgeInsets.only(top: 30, left: 12, right: 12, bottom: 12),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 4 * offset.abs()),
              BoxShadow(
                  color: Colors.black12, blurRadius: 10 + 6 * offset.abs()),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildCurrencySymbol(),
              _buildRateValue(),
              _buildCurrencyName(),
            ],
          ),
        ),
      );

  Widget _buildCurrencySymbol() => Text(
        rateInfo.symbol,
        style: Styles.symbolCardStyle,
      );

  Widget _buildRateValue() => Text(
        rateInfo.value,
        style: Styles.rateValueStyle,
      );

  Widget _buildCurrencyName() => Text(
        rateInfo.base,
        style: Styles.currencyNameStyle,
      );
}
