import 'package:exchange_app/app/ui/widgets/retry_widget.dart';
import 'package:exchange_app/data/entity/internal/rate_info.dart';
import 'package:flutter/material.dart';

import '../home_bloc.dart';
import 'loading_widget.dart';
import 'results_widget.dart';

class HomePageContentWidget extends StatelessWidget {
  final HomeBloc _bloc;

  HomePageContentWidget(this._bloc);

  @override
  Widget build(BuildContext context) => StreamBuilder<List<RateInfo>>(
    stream: _bloc.rateInfoList,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return ResultsWidget(_bloc);
      } else if (snapshot.hasError) {
        return RetryWidget(_bloc);
      }
      return LoadingWidget();
    },
  );
}

