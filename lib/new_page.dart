import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute
        .of(context)
        .settings
        .arguments;
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("我是标题"),
        backgroundColor: Colors.red,
      ),
      body: new Center(
          child: Text(args),
      ),
    );
  }
}