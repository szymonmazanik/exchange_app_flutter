import 'package:exchange_app/app/ui/home_bloc.dart';
import 'package:exchange_app/app/ui/widgets/home_page_content_widget.dart';
import 'package:exchange_app/app/utils/app_colors.dart';
import 'package:exchange_app/app/utils/bloc_provider.dart';
import 'package:flutter/material.dart';

import 'widgets/home_background_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<HomeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Stack(
        children: <Widget>[
          HomeBackgroundWidget(),
          HomePageContentWidget(_bloc),
        ],
      ),
    );
  }
}