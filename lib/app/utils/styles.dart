import 'package:flutter/material.dart';

import 'app_colors.dart';

class Styles {
  static final symbolTabbarStyle = TextStyle(
    color: AppColors.textColor,
    fontSize: 24,
  );
  static final symbolCardStyle = TextStyle(
      color: AppColors.textColor, fontSize: 128, fontFamily: 'Lobster');
  static final rateValueStyle =
      TextStyle(color: AppColors.textColor, fontSize: 32);
  static final currencyNameStyle =
      TextStyle(color: AppColors.textColor, fontSize: 16);

  static final errorLabelStyle = TextStyle(
    color: AppColors.textColor,
    fontWeight: FontWeight.w800,
    fontSize: 35,
  );

  static final errorMessageStyle = TextStyle(
    color: AppColors.textColor,
    fontWeight: FontWeight.w800,
    fontSize: 25,
  );

  static final slideToRetryStyle = TextStyle(
    color: AppColors.textColor,
    fontWeight: FontWeight.w400,
    fontSize: 17,
  );

  static final appNameStyle = TextStyle(
    color: AppColors.textColor,
    fontWeight: FontWeight.w600,
    fontSize: 17,
    shadows: <Shadow>[
      Shadow(
        offset: Offset(2.0, 2.0),
        blurRadius: 3.0,
        color: Colors.black,
      ),
    ],
  );

  static final singleCalculationTextStyle = TextStyle(
    fontSize: 18,
    shadows: [
      Shadow(
        blurRadius: 3.0,
        color: AppColors.secondaryColor,
        offset: Offset(1.0, 1.0),
      ),
    ],
  );
}
