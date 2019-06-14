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
          centerTitle: true,
          leading: Icon(Icons.menu),
          actions: <Widget>[
            Icon(Icons.ondemand_video),
            Icon(Icons.headset),
          ],
        ),
        body: Center(
          child: Text('请收起你大胆地想法！！'),
        ),
      ),
//      theme: GlobalConfig.themeData,
    );
  }
}
