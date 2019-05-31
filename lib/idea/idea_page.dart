import 'package:flutter/material.dart';
import 'package:firstflutter/global_config.dart';

class IdeaPage extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _IdeaPageState();
  }

}

class _IdeaPageState extends State<IdeaPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('想法'),
        ),
        body: Center(
          child: null,
        ),
      ),
//      theme: GlobalConfig.themeData,
    );
  }
}