import 'package:exchange_app/app/ui/widgets/app_name_widget.dart';
import 'package:flutter/material.dart';

import 'color_loader_wiget.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: ColorLoaderWidget(),
        ),
        AppNameWidget(),
      ],
    );
  }
}
