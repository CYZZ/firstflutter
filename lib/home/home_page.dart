import 'package:flutter/material.dart';
import 'package:firstflutter/global_config.dart';

class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }

}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('首页'),
        ),
        body: Center(
          child: null,
        ),
      ),
//      theme: GlobalConfig.themeData,
    );
  }
}