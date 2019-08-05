import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // final wordPair = new WordPair.random();
    return new MaterialApp(
      title: 'hello word',
      home: new Scaffold(
        appBar:new AppBar(
          title: new Text("标题"),
        ),
        body: new Center(
          // child: new Text('Hello World'),
          // child: new Text(wordPair.asPascalCase), //asPascalCase 驼峰样式
          child: new RandomWords(),
        ),
      ),
    );
  }

}

class RandomWords extends StatefulWidget{
  @override
  createState() =>new RandomWordsState();
//  State<StatefulWidget> createState() {
//    return new RandomWordsState();
// }

}

class RandomWordsState extends State<RandomWords>{
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return const Text.rich(
      TextSpan(
        text: 'Hello',
        children: <TextSpan>[
          TextSpan(text: 'beautiful',style: TextStyle(fontStyle: FontStyle.italic)),
          TextSpan(text: 'word',style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      )
    );
//    return new Text(
//        wordPair.asPascalCase,
//      textAlign: TextAlign.center,
//      overflow: TextOverflow.ellipsis,
//      style: TextStyle(fontWeight: FontWeight.bold),
//    );
  }

}