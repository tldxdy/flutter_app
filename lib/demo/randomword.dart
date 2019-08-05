import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = new Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18);


  @override
  Widget build(BuildContext context) {
    // TODO: implement buildfff
//    final word = new WordPair.random();
//    return new Text(word.asPascalCase);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Genrated Word'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSetting(),
    );
  }

  Widget _buildSetting() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, i){
        if(i.isOdd) return new Divider();

        final index = i ~/ 2;
        if(index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair word) {
    final alreadySaved = _saved.contains(word);

    return new ListTile(
      leading: new CircleAvatar(
        child: Image.asset('images/pic1.jpg'),
        radius: 20,
      ) ,
      title: new Text(
        word.asPascalCase,
        style: _biggerFont,
      ),
      subtitle: new Text(
        _suggestions.indexOf(word).toString(),
        style: new TextStyle(
          color: Colors.red[200],
        ),
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: (){
        setState(() {
          if (alreadySaved) {
            _saved.remove(word);
          }else {
            _saved.add(word);
          }
        });
      },
    );
  }

  void _pushSaved() {

    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context){
          final titles = _saved.map(
                  (word) {
                return new ListTile(
                  title: new Text(
                    word.asPascalCase,
                    style: _biggerFont,
                  ),

                );
              }
          );
          final divides = ListTile
              .divideTiles(
            tiles: titles,
            context: context,
          )
              .toList();
          return new Scaffold(
            appBar: new AppBar(
              title: new Text(
                  'Saved Words'
              ),
            ),
            body: new ListView(children: divides),
          );
        },
      ),
    );
  }
}

