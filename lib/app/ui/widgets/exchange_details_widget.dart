import 'package:exchange_app/app/ui/home_bloc.dart';
import 'package:exchange_app/app/utils/bloc_provider.dart';
import 'package:exchange_app/app/utils/styles.dart';
import 'package:exchange_app/data/entity/internal/rate_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExchangeDetailsWidget extends StatefulWidget {
  @override
  _ExchangeDetailsWidgetState createState() => _ExchangeDetailsWidgetState();
}

class _ExchangeDetailsWidgetState extends State<ExchangeDetailsWidget> {
  HomeBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<HomeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return StreamBuilder<List<RateInfo>>(
      stream: _bloc.rateInfoList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var rateInfoList = snapshot.data;
          return StreamBuilder<int>(
            stream: _bloc.currentRateInfoIndex,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var currentRateInfoIndex = snapshot.data;
                var currentRateInfo = rateInfoList[currentRateInfoIndex];
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: Stack(
                    children: <Widget>[
                      Opacity(
                        opacity: 0.8,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60),
                          ),
                          child: Container(
                            width: size.width * 0.75,
                            height: size.height * .25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        child: _buildCalculations(currentRateInfo),
                        width: size.width * 0.75,
                        height: size.height * .20,
                      ),
                    ],
                  ),
                );
              }
              return Container();
            },
          );
        }
        return Container();
      },
    );
  }

  Widget _buildCalculations(RateInfo rateInfo) => StreamBuilder<int>(
        stream: _bloc.currentCurrencyBaseIndex,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var currentBaseIndex = snapshot.data;
            var base = HomeBloc.baseCurrencies[currentBaseIndex];
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                _buildSingleCalculationsRow(
                    '10 $base', '${rateInfo.valueTimesTen} ${rateInfo.base}'),
                SizedBox(
                  height: 15,
                ),
                _buildSingleCalculationsRow('100 $base',
                    '${rateInfo.valueTimesHundred} ${rateInfo.base}'),
                SizedBox(
                  height: 15,
                ),
                _buildSingleCalculationsRow('1000 $base',
                    '${rateInfo.valueTimesThousand} ${rateInfo.base}')
              ],
            );
          }
          return Container();
        },
      );

  Widget _buildSingleCalculationsRow(String label1, String label2) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            label1,
            textDirection: TextDirection.rtl,
            style: Styles.singleCalculationTextStyle,
          ),
          SizedBox(
            width: 10,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              '=',
              style: Styles.singleCalculationTextStyle,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            label2,
            style: Styles.singleCalculationTextStyle,
          ),
        ],
      );
}
