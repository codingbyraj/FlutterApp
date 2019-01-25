import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './model/player.dart';

class DetailsPage extends StatelessWidget {
  final Player player;

  DetailsPage({Key key, this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10.0),
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("./assets/" + player.imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color.fromRGBO(64, 100, 96, .1),
          ),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        )
      ],
    );

    final bottomContent = Container(
      child: Column(
        children: <Widget>[
          //full name
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Text(
              player.fullName,
              style: TextStyle(
                color: Color.fromRGBO(64, 100, 96, .9),
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //batting style
          Container(
            margin: EdgeInsets.only(top: 15.0),
            child: Center(
              child: Text(
                "Batting Style: ${player.style}",
                style: TextStyle(
                  color: Color.fromRGBO(1, 12, 1, 0.5),
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          //description
          Container(
            margin: EdgeInsets.only(
              top: 15.0,
              left: 10.0,
              right: 10.0,
              bottom: 20.0,
            ),
            child: Center(
              child: Text(
                player.description,
                style: TextStyle(
                    color: Color.fromRGBO(1, 12, 1, 0.8),
                    fontSize: 20.0,
                    height: 1.2),
                textAlign: TextAlign.justify,
              ),
            ),
          )
        ],
      ),
    );

    return Scaffold(
      body: ListView(
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }
}
