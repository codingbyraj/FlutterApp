import 'package:cricadda/data.dart';
import 'package:cricadda/playersdetails.dart';
import 'package:flutter/material.dart';

import './model/player.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cric Adda',
      home: ListPage(title: 'Cric Adda'),
      theme: ThemeData(primaryColor: Color.fromRGBO(64, 100, 96, 1)),
    );
  }
}

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    return _ListPage();
  }
}

class _ListPage extends State<ListPage> {
  List players;

  @override
  void initState() {
    players = getPlayerData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final topHeader = AppBar(
      elevation: 1,
      title: Text('Cric Adda'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.list),
          onPressed: () {},
        )
      ],
    );

    final bottomNavigationBar = Container(
      height: 55.0,
      child: BottomAppBar(
        elevation: 1,
        color: Color.fromRGBO(28, 40, 51, 0.8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: IconButton(
                icon: Image(
                  image: AssetImage("./assets/bat.png"),
                ),
                onPressed: () {},
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: IconButton(
                icon: Image(
                  image: AssetImage("./assets/ball.png"),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );

    ListTile makeListTile(Player currentPlayer) => ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 15.0,
          ),
          leading: Container(
            margin: EdgeInsets.only(right: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image(
                image: AssetImage("./assets/" + currentPlayer.imagePath),
                height: 60.0,
                width: 60.0,
              ),
            ),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 2.5,
              ),
              color: Color.fromRGBO(0, 0, 0, 0.2),
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
          title: Text(
            currentPlayer.name,
            // textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          subtitle: Text(
            currentPlayer.style,
            // textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
            size: 30.0,
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(
                        player: currentPlayer,
                      ),
                ));
          },
        );

    Card makeCard(Player currentPlayer) => Card(
          elevation: 8.0,
          margin: EdgeInsets.symmetric(
            horizontal: 5.0,
            vertical: 6.0,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(64, 100, 96, .9),
            ),
            child: makeListTile(currentPlayer),
          ),
        );

    final mybody = Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: playersData.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(players[index]);
        },
      ),
    );

    return Scaffold(
      appBar: topHeader,
      body: mybody,
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  List getPlayerData() {
    return playersData;
  }
}
