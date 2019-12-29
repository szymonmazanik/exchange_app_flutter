import 'package:exchange_app/app/ui/home_bloc.dart';
import 'package:exchange_app/app/ui/home_page.dart';
import 'package:exchange_app/app/utils/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        bloc: HomeBloc(),
        child: HomePage(),
      ),
    );
  }
}
