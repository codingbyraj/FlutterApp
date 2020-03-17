class Todo {
  // member variables
  int _id;
  String _title, _description, _date;
  int _priority;

  // constructors
  Todo(this._title, this._priority, this._date, [this._description]);
  
  Todo.withId(this._id, this._title, this._priority, this._date, [this._description]);

  // // getters
  
  int get id => _id;
  String get title => _title;
  String get date => _date;
  String get description => _description;
  int get priority => _priority;

  // // setters
  set title(String newTitle) {
    if (newTitle.length <= 255) {
      _title = newTitle;
    }
  }

  set date(String newDate) {
    _date = newDate;
  }

  set description(String newDescription) {
    if (newDescription.length <= 255) {
      _description = newDescription;
    }
  }

  set priority(int newPriority) {
    if (newPriority > 0 && newPriority <= 3) {
      _priority = newPriority;
    }
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["title"] = _title;
    map["date"] = _date;
    map["description"] = _description;
    map["priority"] = _priority;
    if (_id != null) {
      map["id"] = _id;
    }
    return map;
  }

  Todo.formObject(dynamic o){
    _id = o["id"];
    _title = o["title"];
    _description = o["description"];
    _date = o["date"];
    _priority = o["priority"];
  }
}
