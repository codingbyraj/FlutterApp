import 'package:flutter/material.dart';
// import 'package:todo_app/model/todo.dart';
import 'package:todo_app/screens/todolist.dart';
// import 'package:todo_app/util/dbhelper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  void something(){
    print("this is something");
    // return "this is something";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo Application',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(this.something),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // MyHomePage({Key key}) : super(key: key);
  MyHomePage(Function something){
    something();
  }
  // final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {    
    // List<Todo> todos = List<Todo>();
    // DBHelper db = DBHelper();
    // db.initializeDB().then((result) {
    //   db.getTodos().then((result) {
    //     todos = result;
    //   });
    // });


    // DateTime today = DateTime.now();
    // Todo todo = Todo("Apples", 1, today.toString(), "This is an apple");
    // db.insertTodo(todo);
    // Todo todo1 = Todo("Banana", 2, today.toString(), "This is an banana");
    // db.insertTodo(todo1);
    // Todo todo2 = Todo("Orange", 3, today.toString(), "This is an orange");
    // db.insertTodo(todo2);    
    return  TodoList();    
  }
}