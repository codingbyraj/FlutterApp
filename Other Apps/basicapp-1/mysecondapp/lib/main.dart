import 'package:flutter/material.dart';

import './product_manager.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Third App by Raj"),
          ),
          body: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(5.0),
            children: [ProductManager()],
          )),
    );
  }
}

void main() {
  runApp(MyApp());
}
