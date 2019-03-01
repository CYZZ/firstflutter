import 'package:flutter/material.dart';
import 'package:firstflutter/global_config.dart';


class MarketPage extends StatefulWidget{
  @override
  _FollowPageState createState() => _FollowPageState();
}

class _FollowPageState extends State<MarketPage>{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text('市场'),
          ),
          body: new Center(
              child: null
          ),
        ),
        theme: GlobalConfig.themeData
    );
  }
}