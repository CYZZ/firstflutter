import 'package:flutter/material.dart';
import 'package:firstflutter/global_config.dart';

class Follow extends StatefulWidget {
  @override
  _FollowPageState createState() => _FollowPageState();
}

class _FollowPageState extends State<Follow> {
  @override
  Widget build(BuildContext context) {
//    return MaterialApp(
//        home: Scaffold(
//          body: Center(child:
//          Text('关注'),
//          ),
//        ),
//        theme: GlobalConfig.themeData);
//  }
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 5),
        child: Column(
          children: <Widget>[
            Text('消息'),
            Text('消息'),
            Text('消息'),
          ],
        ),
      ),
    );
  }
}
