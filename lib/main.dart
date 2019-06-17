import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'index/index.dart';
import 'custombottom/yzmainTab.dart';

void main() => runApp(
  ZhiHu()
);

class ZhiHu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "知乎的模仿版本",
//      home: Index() ,
      home: MainTabbar(),
    );
  }
}