import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> _products; // final keyword is added because _products is immutable(can not change) here.
  Products(this._products);
  Widget build(BuildContext context) {
    return Column(
        children: _products
            .map(
              (element) => Card(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Image.asset('./assets/profile_pic.PNG'),
                          alignment: Alignment(0, 0),
                        ),
                        Text.rich(TextSpan(
                            text: element,
                            style: TextStyle(
                                fontFamily: 'Times new Roman',
                                fontSize: 22,
                                color: Colors.black)))
                      ],
                    ),
                  ),
            )
            .toList());
  }
}
