import 'package:flutter/material.dart';
import 'package:spritewidget/spritewidget.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  MyWidgetState createState() => new MyWidgetState();
}

class MyWidgetState extends State<MyWidget> {
  NodeWithSize rootNode;

  @override
  void initState() {
    super.initState();
    rootNode = new NodeWithSize(const Size(1024.0, 1024.0));
  }

  @override
  Widget build(BuildContext context) {
  	return new SpriteWidget(rootNode);
  }
}