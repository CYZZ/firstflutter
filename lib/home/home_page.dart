import 'package:flutter/material.dart';
import 'package:firstflutter/global_config.dart';

import 'follow.dart';
import 'recommend.dart';
import 'hot.dart';

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

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white10,
          title: Text('首页'),
          bottom: TabBar(
            tabs: [
              Tab(text: "关注"),
              Tab(text: "推荐"),
              Tab(text: "热榜"),
            ],
            labelColor: Color(0xFFff4411),
            unselectedLabelColor: Colors.black,
          ),
        ),
        body: TabBarView(children: [
          Follow(),
          Recommend(),
          Hot(),
        ]),
      ),
    );

//    return new MaterialApp(
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('首页'),
//        ),
//        body: Center(
//          child: null,
//        ),
//      ),
////      theme: GlobalConfig.themeData,
//    );
  }
}
