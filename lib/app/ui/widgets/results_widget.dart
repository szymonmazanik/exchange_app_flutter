import 'package:exchange_app/app/ui/widgets/exchange_card_list.dart';
import 'package:exchange_app/app/ui/widgets/exchange_details_widget.dart';

import 'package:flutter/material.dart';

import 'currencies_bar_widget.dart';

class ResultsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: size.height * 0.07,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: CurrenciesBarWidget(),
          ),
          ExchangeCardList(),
          ExchangeDetailsWidget(),
        ],
      ),
    );
  }
}
