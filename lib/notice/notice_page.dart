import 'package:flutter/material.dart';
import 'package:firstflutter/global_config.dart';

class NoticePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NoticePageState();
  }
}

class _NoticePageState extends State<NoticePage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('通知'),
        ),
        body: Center(
          child: null,
        ),
      ),
//      theme: GlobalConfig.themeData,
    );
  }
}