import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  List<String> _products = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Second App by Raj"),
          ),
          body: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(5.0),
            children: [
              Container(
                width: 10,
                child: RaisedButton(
                  child: Text("Click Here"),                  
                  onPressed: () {
                    setState(() {
                      _products.add("raj");
                    });
                  },
                ),
              ),
              Column(
                  children: _products
                      .map(
                        (element) => Card(
                          margin: EdgeInsets.fromLTRB(0,20,0,20),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    child:
                                        Image.asset('./assets/profile_pic.PNG'),
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
                      .toList())
            ],
          )),
    );
  }
}

void main() {
  runApp(MyApp());
}
