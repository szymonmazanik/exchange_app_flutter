import 'package:exchange_app/app/ui/widgets/animated_tabbar_widget.dart';
import 'package:exchange_app/app/utils/app_colors.dart';
import 'package:exchange_app/app/utils/bloc_provider.dart';
import 'package:exchange_app/data/utils/currency_utils.dart';
import 'package:flutter/material.dart';

import '../home_bloc.dart';

class CurrenciesBarWidget extends StatefulWidget {
  @override
  _CurrenciesBarWidgetState createState() => _CurrenciesBarWidgetState();
}

class _CurrenciesBarWidgetState extends State<CurrenciesBarWidget>
    with SingleTickerProviderStateMixin {
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
  HomeBloc _bloc;
  int _currentIndex = HomeBloc.initialBarIndex;
  TabController tabController;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<HomeBloc>(context);
    tabController = TabController(
        vsync: this,
        initialIndex: HomeBloc.initialBarIndex,
        length: _children.length);
    tabController.addListener(onTabViewChange);
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      tabController.animateTo(index);
    });
    _bloc.currentCurrencyBaseIndexSink.add(index);
  }

  onTabViewChange() {
    setState(() {
      _currentIndex = tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
