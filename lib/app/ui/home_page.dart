import 'package:exchange_app/app/ui/widgets/home_page_content_widget.dart';
import 'package:exchange_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'widgets/home_background_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Stack(
        children: <Widget>[
          HomeBackgroundWidget(),
          HomePageContentWidget(),
        ],
      ),
    );
  }
}
