import 'package:cricadda/data.dart';
import 'package:cricadda/model/player.dart';
import 'package:cricadda/screens/BottomNav.dart';
import 'package:cricadda/screens/cricketer_list.dart';
import 'package:flutter/material.dart';

class BasePage extends StatefulWidget {
  @override
  createState() => _BasePage();
}

class _BasePage extends State<BasePage> {
  String title = "Batsman";
  List<Player> playerData = playersBatting;

  @override
  Widget build(BuildContext context) {
    final bottomNavigationBar = Container(
      height: 65.0,
      margin: EdgeInsets.all(0.0),
      child: BottomAppBar(
        elevation: 1,
        color: Color.fromRGBO(64, 100, 96, 1),
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
                onPressed: () {
                  setState(() {
                    this.title = "Batsman";
                    this.playerData = playersBatting;
                  });
                },
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
                onPressed: () {
                  setState(() {
                    this.title = "Baller";
                    this.playerData = playersBalling;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );

    callback(playerType) {
      print("called parent");
      setState(() {
        if (playerType == "Batters") {
          this.playerData = playersBatting;
        } else {
          this.playerData = playersBalling;
        }
      });
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.8),
      appBar: AppBar(
        elevation: 1,
        title: Text(
          'Cric Adda',
        ),
      ),
      body: CricketerList(this.title, this.playerData),
      bottomNavigationBar: BottomNav(callback),
    );
  }
}
