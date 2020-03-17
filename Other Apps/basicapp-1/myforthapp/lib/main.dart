import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const MyHomePage(),
    );
  }
}

class Person {
  const Person({this.name, this.imageUrl, this.description, this.age});
  final String name;
  final String imageUrl;
  final String  description;
  final int age;
}

final List<Person> _list = <Person>[
  Person(name: "Aman", imageUrl: "", description: "", age: 1),
  Person(name: "Anuj", imageUrl: "", description: "", age: 1),
  Person(name: "Jacinth", imageUrl: "", description: "", age: 1),
  Person(name: "Abhishek", imageUrl: "", description: "", age: 1)
];

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);
  
  Widget _dialogBuilder(BuildContext context, Person person){
    return SimpleDialog(children: [Container(width: 80, height: 80)]);
  }


Widget _listBuilder(BuildContext context, int index) {
    return new GestureDetector(
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        alignment: Alignment.centerLeft,
        child: Text.rich(
          TextSpan(
            text: _list[index].name + ' - ' + index.toString(),
          ),
          style: Theme.of(context).textTheme.headline,
        ),
      ),
      onTap: () => showDialog(
        context: context,
        builder: (context)=>_dialogBuilder(context,_list[index])
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Friends"),
      ),
      body: ListView.builder(
        itemCount: _list.length,
        itemExtent: 20,
        itemBuilder: _listBuilder,
      ),
    );
  }
}
