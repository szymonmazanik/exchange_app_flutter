import 'package:exchange_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppNameWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 20),
      child: Text(
        'exchange_rate_flutter',
        style: TextStyle(
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
        ),
      ),
    );
  }
}
