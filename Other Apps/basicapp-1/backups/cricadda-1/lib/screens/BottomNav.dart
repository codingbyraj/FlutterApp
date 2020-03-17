import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget{
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
  }
}