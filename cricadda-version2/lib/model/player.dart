class Record {
  int matches;
  int innings;
  int runs;
  int century;
  int halfcentury;
  int highestScore;
  Record(
      {this.matches,
      this.innings,
      this.runs,
      this.century,
      this.halfcentury,
      this.highestScore});
}

class Player {
  String name;
  String fullName;
  String imagePath;
  String style;
  String description;
  List<Record> records;
  Player(
      {this.name,
      this.fullName,
      this.imagePath,
      this.style,
      this.description,
      this.records});
}
