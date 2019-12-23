import 'package:exchange_app/app/ui/widgets/exchange_card_list.dart';
import 'package:exchange_app/app/utils/styles.dart';
import 'package:flutter/material.dart';

import '../home_bloc.dart';
import 'currencies_bar_widget.dart';

class ResultsWidget extends StatefulWidget {
  final HomeBloc _bloc;

  ResultsWidget(this._bloc);

  @override
  _ResultsWidgetState createState() => _ResultsWidgetState();
}

class _ResultsWidgetState extends State<ResultsWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 55,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Styles.hzScreenPadding),
              child: CurrenciesBarWidget(widget._bloc),
            ),
            SizedBox(
              height: 40,
            ),
            ExchangeCardList(widget._bloc),
//            HotelList(_currentCity.hotels),
            Expanded(child: SizedBox()),
          ],
        ),
      );
}
