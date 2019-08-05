import 'package:flutter/material.dart';


void main() => runApp(new MyApp());


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'BottomBar',
      home: new MyTabbedPage(),
    );
  }

}

class MyTabbedPage extends StatefulWidget{
  const MyTabbedPage({ Key key }) : super(key: key);
  @override
  createState() => new _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage> with SingleTickerProviderStateMixin {
  final List<Tab> myTabs= <Tab>[
    Tab(text: 'LEFT'),
    Tab(text: 'RIGHT'),
  ];
  TabController _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: myTabs,
          labelColor: Colors.grey,
          unselectedLabelColor: Colors.white,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab){
          final String label = tab.text.toLowerCase();
          return Center(
            child: Text(
              'This is the $label tab',
              style: const TextStyle(
                  fontSize: 36,
                  backgroundColor: Colors.blue,
              ),

            ),
          );
        }).toList(),
      ),
    );
  }
}