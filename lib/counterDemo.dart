import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:http/http.dart' as http;
import 'new_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: '计数器',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      //注册路由表
      routes:{
        "new_page":(context)=>NewRoute(),
      } ,

      home: new MyHomePage(title:"the is counter:"),
    );
  }
}

class MyHomePage extends StatefulWidget{
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState()=>_MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
                image: AssetImage("images/lake.jpg"),
                width: 100.0
            ),
            Image(
              image: NetworkImage("https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
              width: 100.0,
            ),
            new Text(
              'You have pushed the button this many times:',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  height: 1.2,
                  //fontFamily: "Courier",
                  background: new Paint()..color=Colors.grey,
                  decoration:TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed
              ),
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text("open new route"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("new_page", arguments: "hi");

                //导航到新路由
                //Navigator.pushNamed(context, "new_page");
//                Navigator.push( context,
//                    new MaterialPageRoute(builder: (context) {
//                      return new NewRoute();}));
              },
            ),

            RandomWordsWidget(),
            Text.rich(TextSpan(
                children: [
                  TextSpan(
                      text: "Home: "
                  ),
                  TextSpan(
                      text: "https://flutterchina.club",
                      style: TextStyle(
                          color: Colors.blue
                      ),
                      //recognizer: _tapRecognizer,
                  ),
                ]
            )),


            RaisedButton(
              child: Text("normal"),
              onPressed: () => {},
            ),
            FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("normal"),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: () => {},
            ),
            OutlineButton(
              child: Text("normal"),
              onPressed: () => {},
            ),
            IconButton(
              color: Colors.blue,
              icon: Icon(Icons.thumb_up),
              onPressed: () => {},
            ),
          ],
        ),

      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}


class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 生成随机字符串
    final wordPair = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(wordPair.toString()),
    );
  }
}