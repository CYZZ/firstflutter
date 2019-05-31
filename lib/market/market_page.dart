import 'package:flutter/material.dart';
import 'package:firstflutter/global_config.dart';

class MarketPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MarketPageState();
  }

}

class _MarketPageState extends State<MarketPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('市场'),
        ),
        body: Center(
          child: null,
        ),
      ),
//      theme: GlobalConfig.themeData,
    );
  }
}