import 'package:flutter/material.dart';

import '../product/product_manager.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("A Raj"),
            accountEmail: Text("rai.abhishekraj@gmail.com"),
            otherAccountsPictures: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.add_comment,
                    color: Colors.white,
                    size: 36.0,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<bool>(
                        builder: (context) => ProductManager(),
                      ),
                    );
                  })
            ],
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              backgroundImage: AssetImage("assets/profile_pic.PNG"),
            ),
          ),
          ListTile(
            title: Text.rich(
              TextSpan(
                text: 'Index',
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text.rich(
              TextSpan(
                text: 'Sent',
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text.rich(
              TextSpan(
                text: 'Draft',
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text.rich(
              TextSpan(
                text: 'Deleted',
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}