import 'package:cricadda/model/player.dart';
import 'package:cricadda/screens/playersdetails.dart';
import 'package:flutter/material.dart';

class CricketerList extends StatelessWidget {
  final String title;
  final List<Player> players;

  CricketerList(this.title, this.players);

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Player currentPlayer) => ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 10.0,
          ),
          leading: Container(
            margin: EdgeInsets.only(right: 5.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("./assets/" + currentPlayer.imagePath),
              backgroundColor: Colors.white,
              radius: 40.0,
            ),
            padding: EdgeInsets.all(10.0),            
          ),
          title: Text(
            currentPlayer.name,            
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
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
            horizontal: 3.0,
            vertical: 3.0,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(64, 100, 96, .9),
            ),
            child: makeListTile(currentPlayer),
          ),
        );

    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: players.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(players[index]);
        },
      ),
    );
  }
}
