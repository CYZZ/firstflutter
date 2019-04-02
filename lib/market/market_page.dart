import 'package:flutter/material.dart';
import 'package:firstflutter/global_config.dart';


class MarketPage extends StatefulWidget{
  @override
  _FollowPageState createState() => _FollowPageState();
}

class _FollowPageState extends State<MarketPage>{



  Widget _buildList(BuildContext context) {
    var content;

  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
          backgroundColor: Colors.green[50],
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