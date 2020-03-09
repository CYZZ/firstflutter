import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';




//***************
class MyPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RandomWordsState();
  }
//  @override
//  createState() => RandomWordsState();
}

class RandomWordsState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('😁🐦🐓🦆🤣 Name 😄'),
      ),
      body: _buildSuggestions(),
    );
  }

  final _saved = Set<WordPair>();
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    // TODO: implement build
//    final wordPair = WordPair.random();
//    return Text(wordPair.asPascalCase);

    return ListView.builder(
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();
        final index = i ~/ 2; //向下取整
        // 如果遍历到了最后一个单词
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
      padding: const EdgeInsets.all(16.0),
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved?Colors.red:null,
      ),
      onTap: (){
        print('abcd');

        setState(() {
          if(alreadySaved){
            _saved.remove(pair);
          }else{
            _saved.add(pair);
          }
        });
      },
    );
  }
}