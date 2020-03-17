import 'package:cricadda/model/player.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  
  Function(String) callback;
  
  BottomNav(this.callback){

  }
  @override
  State<StatefulWidget> createState() {
    return _BottomNav();
  }
}

class _BottomNav extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.0,
      margin: EdgeInsets.all(0.0),
      // padding: EdgeInsets.all(10.0),
      child: BottomAppBar(
        elevation: 1,
        color: Color.fromRGBO(64, 100, 96, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: IconButton(
                icon: Image(
                  image: AssetImage("./assets/bat.png"),
                ),
                onPressed: () {
                  widget.callback('Batters');
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: IconButton(
                icon: Image(
                  image: AssetImage("./assets/ball.png"),
                ),
                onPressed: () {
                  widget.callback('Ballers');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
