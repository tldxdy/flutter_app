import 'package:flutter/material.dart';


void main() => runApp(new MyApp());


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'BottomBar',
      home: new MyHome(),
    );
  }

}

class MyHome extends StatefulWidget{
  @override
  createState() => new MyHomes();

}



class MyHomes extends State<MyHome>{
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new  Scaffold(
        appBar: new AppBar(
          title: Text('BottomBar'),
          centerTitle: true,
        ),
        body: new Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const<BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('首页'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.confirmation_number),
              title: Text('消息'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              title: Text('我的'),
            ),
          ],
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
        ),
      );
  }
}