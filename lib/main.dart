import 'package:eyepetizer/page/splash_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '开眼',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),//title: 'Flutter Demo Home Page'
    );
  }
}
