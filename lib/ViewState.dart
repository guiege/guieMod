import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:ui' as ui;

import 'package:simple_gradient_text/simple_gradient_text.dart';

class ViewState extends StatefulWidget{
  const ViewState({super.key});

  @override
  State<ViewState> createState() => _ViewState();

}

class _ViewState extends State<ViewState>{
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};
  final _biggerFont = const TextStyle(fontSize: 18, color:  Color.fromRGBO(108,44,244,0.75));

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        elevation: 0,
        toolbarHeight: 80,
        title: GradientText(
          'MODS',
          style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 25,
              height: 1,
              letterSpacing: 2
          ),
          colors: const [
            Color(0xffA4508B),
            Color(0xff5F0A87),
          ],
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i){
          if(i.isOdd) return const Divider();
          final index = i ~/ 2;
          if(index >= _suggestions.length){
            _suggestions.addAll(generateWordPairs().take(10));
          }
          final alreadySaved = _saved.contains(_suggestions[index]);
          return ListTile(
            title: Text(
              _suggestions[index].asPascalCase,
              style: _biggerFont,
            ),
            trailing: Icon(
              alreadySaved ? Icons.favorite : Icons.favorite_border,
              color: alreadySaved ? Colors.redAccent : null,
              semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
            ),
            onTap: () {
              setState(() {
                if(alreadySaved){
                  _saved.remove(_suggestions[index]);
                } else{
                  _saved.add(_suggestions[index]);
                }
              });
            },
          );
        },
      ),
    );
  }
}