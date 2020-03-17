import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/screens/tododetails.dart';
import 'package:todo_app/util/dbhelper.dart';

final List<String> sortingMenu = const <String>[
  "Sort by Priortiy",
  "Sort by Date",
];

const sortPriority = "Sort by Priortiy";
const sortDate = "Sort by Date";

class TodoList extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return _TodoList();
  }
  
}

class _TodoList extends State<TodoList> {
// here my target is to get all todos and its count
  DBHelper db = DBHelper();
  List<Todo> _todos;
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    if (_todos == null) {
      _todos = List<Todo>();
      getTodosData();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: selectMenu,
            itemBuilder: (BuildContext context) {
              return sortingMenu.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
      ),
      body: todoListItems(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToDetails(Todo('', 3, '', ''));
        },
        tooltip: "Add New Todo",
        child: Icon(Icons.add),
      ),
    );
  }

  void getTodosData([String col, String order]) {    
    final dbFuture = db.initializeDB();
    dbFuture.then((result) {
      final todosFuture = db.getTodos(col, order);
      todosFuture.then((result) {
        List<Todo> todoList = List<Todo>();
        _count = result.length;
        for (int i = 0; i < _count; ++i) {          
          todoList.add(Todo.formObject(result[i]));
        }
        setState(() {
          _todos = todoList;
          _count = _count;
        });
      });
    });
  }

  ListView todoListItems() {
    return ListView.builder(
      itemCount: _count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 1.2,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor:
                  getColorAccordingToPriority(_todos[index].priority),
              child: Text(_todos[index].priority.toString()),
            ),
            title: Text(_todos[index].title),
            subtitle: Text(_todos[index].date),
            onTap: () {
              navigateToDetails(_todos[index]);
            },
          ),
        );
      },
    );
  }

  Color getColorAccordingToPriority(int priority) {
    switch (priority) {
      case 1:
        return Colors.red;
        break;
      case 2:
        return Colors.orange;
        break;
      case 3:
        return Colors.green;
        break;
      default:
        return Colors.green;
    }
  }

  void navigateToDetails(Todo todo) async {
    dynamic result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TodoDetails(todo),
      ),
    );
    if (result == true) {
      // if user comes back to the todolist page then update the list from database
      getTodosData();
    }
  }

  void selectMenu(String sortMenuItem) {
    switch (sortMenuItem) {
      case sortPriority:
        print(sortPriority);
        getTodosData('priority', 'ASC');
        break;
      case sortDate:
        print(sortDate);
        getTodosData('date','DESC');
        break;
    }
  }
}
