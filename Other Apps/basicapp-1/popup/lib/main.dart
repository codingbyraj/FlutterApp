import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

enum Answer { YES, NO, MAYBE }

class _MyHomePageState extends State<MyHomePage> {
  String _answer = '';

  void setAnswer(String value) {
    setState(() {
      _answer = value;
    });
  }

  Future<Null> _askUser() async {
    switch (await showDialog(
      context: context,
      child: Container(
        child: SimpleDialog(
          title: Text('Choose any one'),
          children: [
            SimpleDialogOption(
              child: Text('Yes'),
              onPressed: () {
                Navigator.pop(context, Answer.YES);
              },
            ),
            SimpleDialogOption(
              child: Text('No'),
              onPressed: () {
                Navigator.pop(context, Answer.NO);
              },
            ),
            SimpleDialogOption(
              child: Text('Maybe'),
              onPressed: () {
                Navigator.pop(context, Answer.MAYBE);
              },
            ),
          ],
        ),
      ),
    )) {
      case Answer.YES:
        setAnswer('yes');
        break;
      case Answer.NO:
        setAnswer('no');
        break;
      case Answer.MAYBE:
        setAnswer('maybe');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Fifth App"),
      ),
      body: Column(
        children: <Widget>[
          Text('Your clicked ${_answer}'),
          RaisedButton(
            child: Text('Click me!'),
            onPressed: () {
              _askUser();
            },
          )
        ],
      ),
    );
  }
}
