import 'package:flutter/material.dart';
import 'package:firstflutter/global_config.dart';

class Recommend extends StatefulWidget {
  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<Recommend> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text('推荐'),
          ),
        ),
        theme: GlobalConfig.themeData);
  }
}
