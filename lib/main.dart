import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'ListDemo.dart';
import 'demo/randomword.dart';
import 'new_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter 结构简析',
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      //home: new RandomWords(),
      home:new ListDemo(),
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: Text('Demo'),
//          centerTitle: true,
//        ),
//        body: new ListDemo(),
//      ),
    );
  }
}

class MyHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    //Scaffold是Material中主要的布局组件.
    return new Scaffold(
      //appBar是页面的头部
    appBar: new AppBar(
        title: Text('标题'),
        centerTitle: true,
      ),
      //body占屏幕的大部分
      body: new Center(
        child: Text(
          'Hello Word'
        ),
      ),
    );
  }
}