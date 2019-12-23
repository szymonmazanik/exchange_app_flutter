import 'package:exchange_app/app/utils/app_colors.dart';
import 'package:exchange_app/app/ui/widgets/slider_wiget.dart';
import 'package:flutter/material.dart';

import '../home_bloc.dart';
import 'app_name_widget.dart';

class RetryWidget extends StatelessWidget {
  final HomeBloc _bloc;

  RetryWidget(this._bloc);

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
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.w800,
            fontSize: 35,
          ),
        ),
      );

  _buildErrorMessage() => Container(
        margin: EdgeInsets.only(bottom: 60),
        child: Text(
          'Could not load data.',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.w800,
            fontSize: 25,
          ),
        ),
      );

  _buildSlideToRetry() => SliderButtonWidget(
        action: _bloc.getInitialRateInfoList,
        label: Text(
          "Slide to retry",
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.w400,
            fontSize: 17,
          ),
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
