import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/util/dbhelper.dart';


DBHelper db = DBHelper();
final List<String> choices = const <String>[
  'Save Todo & Back',
  'Delete Todo',
  'Back to List'
];

const menuSave = 'Save Todo & Back';
const menuDelete = 'Delete Todo';
const menuBack = 'Back to List';

class TodoDetails extends StatefulWidget {
  final Todo todo;
  TodoDetails(this.todo);

  @override
  State<StatefulWidget> createState() {
    return _TodoDetails(this.todo);
  }
}

class _TodoDetails extends State<TodoDetails> {
  Todo todo;
  final _priorities = ["High", "Medium", "Low"];
  String _priority = "High";
  
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  _TodoDetails(this.todo);

  @override
  Widget build(BuildContext context) {
    titleController.text = todo.title;
    descriptionController.text = todo.description;
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(todo.title),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: select,
            itemBuilder: (BuildContext context) {
              return choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
      ),
      body: Padding(
          padding: EdgeInsets.only(
            top: 35.0,
            left: 10.0,
            right: 10.0,
          ),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  TextField(
                    controller: titleController,
                    style: textStyle,
                    onChanged: (value) => updateTitle(),
                    decoration: InputDecoration(
                        labelText: "Title",
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15.0,
                      bottom: 15.0,
                    ),
                    child: TextField(
                      controller: descriptionController,
                      style: textStyle,
                      onChanged: (value) => updateDescription(),
                      decoration: InputDecoration(
                          labelText: "Description",
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                    ),
                  ),
                  ListTile(
                    title: DropdownButton<String>(
                      items: _priorities.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      // style: textStyle,
                      value: priorityIntToString(todo.priority),
                      onChanged: (value) => priorityStringToInt(value),
                    ),
                  )
                ],
              ),
              
            ],
          )),
    );
  }

  void select(String choice) async {
    int result;
    switch (choice) {
      case menuSave:
        save();
        break;
      case menuDelete:
        Navigator.pop(context, true);
        if (todo.id == null) return;
        result = await db.deleteTodo(todo.id);
        if (result != 0) {
          AlertDialog alertDelete = AlertDialog(
            title: Text("Delete Todo"),
            content: Text("Todo Deleted"),
          );
          showDialog(
            context: context,
            builder: (_) => alertDelete,
          );
        }
        break;
      case menuBack:
        Navigator.pop(context, true);
        break;
    }
  }

  void save() {         
    todo.date = DateFormat.yMd().add_jm().format(new DateTime.now());
    print (todo.date);
    if (todo.id == null && todo.title != "") {
      db.insertTodo(todo);
    } else {
      db.updateTodo(todo);
    }
    Navigator.pop(context, true);
  }

  void priorityStringToInt(String priority) {
    switch (priority) {
      case "High":
        todo.priority = 1;
        break;
      case "Medium":
        todo.priority = 2;
        break;
      case "Low":
        todo.priority = 3;
        break;
    }
    setState(() {
      _priority = priority;
    });
  }

  String priorityIntToString(int priority) {
    return _priorities[priority - 1];
  }

  void updateTitle() {
    todo.title = titleController.text;
  }

  void updateDescription() {
    todo.description = descriptionController.text;
  }
}
