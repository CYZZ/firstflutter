import 'package:firstflutter/notice/model/gold_td_list.dart';
import 'package:firstflutter/notice/model/gold_td_network.dart';
import 'package:firstflutter/notice/view/gold_td_view.dart';
import 'package:flutter/material.dart';
import 'package:firstflutter/global_config.dart';
import 'scoped/under_page.dart';
import 'scoped/blocs/bloc_provider.dart';

class NoticePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NoticePageState();
  }
}

class _NoticePageState extends State<NoticePage> {
  GoldTdList _tdList;
  List<List<GoldTdData>> _tdDataList = [];
  List<String> _tabNames = [
    "银行",
    "TD",
    "其它",
  ];

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider().bloc;
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('通知'),
          actions: <Widget>[
            FlatButton(
              child: Icon(Icons.skip_next),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => UnderPage()));
              },
            )
          ],
        ),
        body: _myTabController(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("开始点击了悬浮球");
            _getTdListData();
          },
          child: Icon(Icons.timer),
        ),
      ),
    );
  }

  /// 获取td列表数据
  _getTdListData() {
    GoldTdNetwork.getGoldTdListModel((tdModel) {
      print("获取的list1=${tdModel.list1}");
      _tdList = tdModel;
      _tdDataList = [
        tdModel.list1,
        tdModel.list2,
        tdModel.list3,
      ];
      setState(() {});
    });
  }

  Widget _myTabController() {
    // 如果没有数据或者请求失败就直接返回空页面
    if (_tdList == null) {
      return Center(
        child: FlatButton(
          onPressed: () {
            _getTdListData();
          },
          child: Text('点击刷新页面'),
        ),
      );
    }

    Widget tabBarContainer = TabBar(
      isScrollable: true,
      unselectedLabelColor: Colors.grey,
      labelColor: Colors.orange,
      // 选中状态的颜色
      indicatorColor: Colors.orange,
      // 指示器的颜色
      indicatorWeight: 2.0,
      // 指示器的高度
      tabs: _tabNames.map((name) {
        return Tab(
          text: name,
        );
      }).toList(), // <Widget>[ ],
    );

    Widget tabController = DefaultTabController(
      length: _tdDataList.length,
      initialIndex: 0,
      child: Column(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(
              height: 60,
            ),
            padding: EdgeInsets.all(8.0),
            color: Colors.tealAccent,
            alignment: Alignment.center,
            child: tabBarContainer,
          ),
          Expanded(
            child: TabBarView(
              children:_tdDataList.map((List<GoldTdData> datas) {
                return goldTdView(datas);
              }).toList(),
            ),
          ),
        ],
      ),
    );
    return tabController;
  }
}
