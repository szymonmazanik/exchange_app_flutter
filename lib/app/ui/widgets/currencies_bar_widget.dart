import 'package:exchange_app/app/ui/widgets/animated_tabbar_widget.dart';
import 'package:exchange_app/app/utils/app_colors.dart';
import 'package:exchange_app/data/utils/currency_utils.dart';
import 'package:flutter/material.dart';

import '../home_bloc.dart';

class CurrenciesBarWidget extends StatefulWidget {
  final HomeBloc _bloc;

  CurrenciesBarWidget(this._bloc);

  @override
  _CurrenciesBarWidgetState createState() => _CurrenciesBarWidgetState();
}

class _CurrenciesBarWidgetState extends State<CurrenciesBarWidget>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  TabController tabController;

  static const _children = [
    {
      'symbol': usdSymbol,
      'title': usd,
    },
    {
      'symbol': cadSymbol,
      'title': cad,
    },
    {
      'symbol': gbpSymbol,
      'title': gbp,
    },
    {
      'symbol': jpySymbol,
      'title': jpy,
    },
    {
      'symbol': thbSymbol,
      'title': thb,
    },
    {
      'symbol': eurSymbol,
      'title': eur,
    }
  ];

  @override
  void initState() {
    super.initState();
    tabController =
        TabController(vsync: this, initialIndex: 0, length: _children.length);
    tabController.addListener(onTabViewChange);
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      tabController.animateTo(index);
    });
    widget._bloc.currentCurrencyBaseIndexSink.add(index);
  }

  onTabViewChange() {
    setState(() {
      _currentIndex = tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
//    return AnimatedTabbarWidget(widget._bloc, children: children, currentIndex: 0,padding:EdgeInsets.only(left: 4, top: 6, right: 4, bottom: 6), );
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      child: Container(
        color: AppColors.primaryColor,
        child: Column(
          children: <Widget>[
            AnimatedTabbarWidget(
              padding: EdgeInsets.only(left: 4, top: 6, right: 4, bottom: 6),
              currentIndex: _currentIndex,
              onTap: onTabTapped,
              children: _children,
            ),
          ],
        ),
      ),
    );
  }
}
