import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RandomWords();
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  String word = WordPair.random().asPascalCase;

  void _setWord() {
    setState(() {
      word = WordPair.random().asPascalCase;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: Text(word),
        ),
        floatingActionButton: FloatingActionButton(onPressed: _setWord, child: Center(child: Icon(Icons.add),),),
      ),
    );
  }
}

// class WordComp extends StatelessWidget {
//   List arry = this.arry
//   @override
//   Widget build(BuildContext context) {
//     return Text(WordPair.random().asPascalCase);
//   }
// }