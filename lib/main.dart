import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home.dart';
import 'view_model/home_view_model.dart';

void main(List<String> args) {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
          create: (BuildContext context) {
            return HomeViewModel();
          },
          child: Home()),
    );
  }
}
