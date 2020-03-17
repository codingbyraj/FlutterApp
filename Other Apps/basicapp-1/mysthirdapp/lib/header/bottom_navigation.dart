import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomNavigation();
  }
}

class _BottomNavigation extends State<BottomNavigation> {
  int _selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.inbox),
          title: Text('Inbox'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.send),
          title: Text('Sent'),
        ),
      ],
      currentIndex: _selectedIndex,
      fixedColor: Colors.blue,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
