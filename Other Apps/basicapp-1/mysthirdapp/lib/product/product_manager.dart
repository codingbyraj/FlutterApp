import 'package:flutter/material.dart';

import './products.dart';

class ProductManager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductManager();
  }
}

class _ProductManager extends State<ProductManager> {
  List<String> _products = [];
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: 100,
        child: RaisedButton(
          child: Text("Click Here"),
          onPressed: () {
            setState(() {
              _products.add("raj");
            });
          },
        ),
      ),
      Products(_products)
    ]);
  }
}