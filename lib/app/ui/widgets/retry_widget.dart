import 'package:exchange_app/app/utils/app_colors.dart';
import 'package:exchange_app/app/ui/widgets/slider_wiget.dart';
import 'package:exchange_app/app/utils/bloc_provider.dart';
import 'package:exchange_app/app/utils/styles.dart';
import 'package:flutter/material.dart';

import '../home_bloc.dart';
import 'app_name_widget.dart';

class RetryWidget extends StatefulWidget {
  @override
  _RetryWidgetState createState() => _RetryWidgetState();
}

class _RetryWidgetState extends State<RetryWidget> {
  HomeBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<HomeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildErrorLabel(),
              _buildErrorMessage(),
              _buildSlideToRetry(),
            ],
          ),
        ),
        AppNameWidget(),
      ],
    );
  }

  _buildErrorLabel() => Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Text(
          'Error',
          style: Styles.errorLabelStyle,
        ),
      );

  _buildErrorMessage() => Container(
        margin: EdgeInsets.only(bottom: 60),
        child: Text(
          'Could not load data.',
          style: Styles.errorMessageStyle,
        ),
      );

  _buildSlideToRetry() => SliderButtonWidget(
        action: _bloc.getInitialRateInfoList,
        label: Text(
          "Slide to retry",
          style: Styles.slideToRetryStyle,
        ),
        icon: Icon(
          Icons.attach_money,
          color: AppColors.textColor,
        ),
        width: 230,
        radius: 10,
        dismissible: false,
        backgroundColor: AppColors.primaryColor,
        buttonColor: AppColors.secondaryColor,
      );
}
