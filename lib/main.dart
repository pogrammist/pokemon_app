import 'package:flutter/material.dart';
import 'package:pokemon_app/pages/loading_second.dart';
import 'package:pokemon_app/pages/loading.dart';
import 'package:pokemon_app/pages/loading_third.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/third',
      routes: {
        '/': (context) => Loading(),
        '/second': (context) => LoadingSecond(),
        '/third': (context) => LoadingThird(),
      },
    );
  }
}
