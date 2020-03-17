import 'package:flutter/material.dart';

import './product/product_manager.dart';
import './header/drawer.dart';
import './header/bottom_navigation.dart';

class TabBarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabBarDemo();
  }
}

class _TabBarDemo extends State<TabBarDemo> {  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(59, 89, 152, 1),
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.accessibility)),
                Tab(icon: Icon(Icons.add_alert)),
                Tab(icon: Icon(Icons.add_comment)),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(5.0),
                children: [ProductManager()],
              ),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
          drawer: MyDrawer(),
          bottomNavigationBar: BottomNavigation(),
        ),
      ),
    );
  }
}
