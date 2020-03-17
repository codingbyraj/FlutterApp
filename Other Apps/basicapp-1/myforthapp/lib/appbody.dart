import 'package:flutter/material.dart';

// import '../model/person.dart';

class Person {
  const Person({this.name, this.imageUrl, this.description, this.age});
  final String name, imageUrl, description;
  final int age;
}

final List<Person> _list = <Person>[
  Person(name: "Aman", imageUrl: "", description: "", age: 1),
  Person(name: "Anuj", imageUrl: "", description: "", age: 1),
  Person(name: "Jacinth", imageUrl: "", description: "", age: 1),
  Person(name: "Abhishek", imageUrl: "", description: "", age: 1)
];

class AppBody extends StatelessWidget {
  const AppBody({Key key}) : super(key: key);

  // Widget _dialogBuilder(BuildContext context, Person person) {
  //   print("hi");
  //   return SimpleDialog(
  //     children: [
  //       Container(
  //         width: 80,
  //         height: 80,
  //       )
  //     ],
  //   );
  // }

  void _onTap() {
    print("tap");
  }

  void _onDoubleTap() {
    print("double tap");
  }

  Widget _listBuilder(BuildContext context, int index) {
    return GestureDetector(
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
      onDoubleTap: _onDoubleTap,
      onTap: _onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _list.length,
      itemExtent: 20,
      itemBuilder: _listBuilder,
    );
  }
}
