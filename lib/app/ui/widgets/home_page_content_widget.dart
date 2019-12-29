import 'package:exchange_app/app/ui/widgets/retry_widget.dart';
import 'package:exchange_app/app/utils/bloc_provider.dart';
import 'package:exchange_app/data/entity/internal/rate_info.dart';
import 'package:flutter/material.dart';

import '../home_bloc.dart';
import 'loading_widget.dart';
import 'results_widget.dart';

class HomePageContentWidget extends StatefulWidget {
  @override
  _HomePageContentWidgetState createState() => _HomePageContentWidgetState();
}

class _HomePageContentWidgetState extends State<HomePageContentWidget> {
  HomeBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<HomeBloc>(context);
  }

  @override
  Widget build(BuildContext context) => StreamBuilder<List<RateInfo>>(
        stream: _bloc.rateInfoList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ResultsWidget();
          } else if (snapshot.hasError) {
            return RetryWidget();
          }
          return LoadingWidget();
        },
      );
}
