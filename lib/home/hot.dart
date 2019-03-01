import 'package:flutter/material.dart';
import 'package:firstflutter/global_config.dart';


class Hot extends StatefulWidget{
  @override
  _HotPageState createState() => _HotPageState();
}

class _HotPageState extends State<Hot>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Center(child:
          Text('热榜'),
          ),
        ),
        theme: GlobalConfig.themeData);
  }
}