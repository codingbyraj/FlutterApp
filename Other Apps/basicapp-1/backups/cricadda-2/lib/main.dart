import 'package:flutter/material.dart';
import './screens/base_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cric Adda',
      home: BasePage(),
      theme: ThemeData(
        primaryColor: Color.fromRGBO(64, 100, 96, 1),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}