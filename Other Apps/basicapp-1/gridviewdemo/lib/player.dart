class Record {
  int _match;
  int _runs;
  Record(this._match, this._runs);

  // getters
  int get match => _match;
  int get runs => _runs;
  // setters
  set match(int m) => _match = m;
  set runs(int r) => _runs = r;
}

class Player {
  String _name;
  List<Record> _record;
  Player(this._name, this._record);

  String get name => _name;
  List<Record> get record => _record;

  set name(String n) => _name = n;
  set record(List<Record> r) => _record = r;
}
