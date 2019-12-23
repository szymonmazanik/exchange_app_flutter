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

//  child: Stack(
//  overflow: Overflow.visible,
//  alignment: Alignment.center,
//  children: <Widget>[
//  Container(
//  margin: EdgeInsets.only(top: 30, left: 12, right: 12, bottom: 12),
//  decoration: BoxDecoration(
//  color: AppColors.primaryColor,
//  borderRadius: BorderRadius.circular(8),
//  boxShadow: [
//  BoxShadow(
//  color: Colors.black12, blurRadius: 4 * offset.abs()),
//  BoxShadow(
//  color: Colors.black12, blurRadius: 10 + 6 * offset.abs()),
//  ],
//  ),
//  ),
//  _buildCurrencySymbol(),
//  _buildCurrencyName(),
//  _buildRateValue(),
//  ],
//  ),

  Widget _buildCurrencySymbol() => Text(
    rateInfo.symbol,
    style: TextStyle(
        color: AppColors.textColor, fontSize: 128, fontFamily: 'Lobster'),
  );

  Widget _buildRateValue() => Text(
        '${rateInfo.value}',
        style: TextStyle(color: AppColors.textColor, fontSize: 32),
      );

  Widget _buildCurrencyName() => Text(
        rateInfo.base,
        style: TextStyle(color: AppColors.textColor, fontSize: 16),
      );

  Widget _buildExchangeData() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(width: double.infinity, height: cardHeight * .57),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(rateInfo.base,
              style: Styles.cardTitle, textAlign: TextAlign.center),
        ),
//        Padding(
//          padding: const EdgeInsets.symmetric(horizontal: 25.0),
//          child: Text(city.description, style: Styles.cardSubtitle, textAlign: TextAlign.center),
//        ),
//        Expanded(child: SizedBox(),),
//        FlatButton(
//          disabledColor: Colors.transparent,
//          color: Colors.transparent,
//          child: Text('Learn More'.toUpperCase(), style: Styles.cardAction),
//          onPressed: null,
//        ),
//        SizedBox(height: 8)
      ],
    );
  }
}
