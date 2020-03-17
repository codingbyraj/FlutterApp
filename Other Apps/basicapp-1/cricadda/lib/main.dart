import 'package:cricadda/screens/home.dart';
import 'package:flutter/material.dart';
import './screens/base_page.dart';

void main() => runApp( new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cric Adda',
      home: BasePage(),
      // home: Text("hello 1"),
      theme: ThemeData(
        primaryColor: Color.fromRGBO(64, 100, 96, 1),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}