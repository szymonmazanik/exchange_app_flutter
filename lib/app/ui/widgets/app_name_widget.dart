import 'package:exchange_app/app/utils/styles.dart';
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
        style: Styles.appNameStyle,
      ),
    );
  }
}
