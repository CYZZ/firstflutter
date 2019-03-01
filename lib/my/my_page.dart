import 'package:flutter/material.dart';
import 'package:firstflutter/global_config.dart';


class MyPage extends StatefulWidget{
  @override
  _FollowPageState createState() => _FollowPageState();
}

class _FollowPageState extends State<MyPage>{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text('我的'),
          ),
          body: new Center(
              child: null
          ),
        ),
        theme: GlobalConfig.themeData
    );
  }
}