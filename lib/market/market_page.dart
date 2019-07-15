import 'package:flutter/material.dart';
import 'package:firstflutter/global_config.dart';
import 'package:firstflutter/util/NetUtils.dart';
import 'package:flutter/widgets.dart';
import 'WYConst.dart';
import 'wytopic_model.dart';
import 'wynewslist_page.dart';

class MarketPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MarketPageState();
  }
}

class _MarketPageState extends State<MarketPage> {
  WYTopicModel _wyTopicModel;
  @override
  void initState() {
    // TODO: implement initState
    // 判断当前滑动位置是不是到达了底部，触发加载更多
    super.initState();
    getTopicData();
  }

  _getListCount() {
    // 是否需要头部
//    if(control.needHeader) {
//
//    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('市场'),
          leading: FlatButton(
            onPressed: () {
              getTopicData();
            },
            child: Icon(
              Icons.list,
              color: Colors.white,
            ),
          ),
        ),
        body: Center(
//          child: _tabContainer(),
          child: _tabContainer(),
        ),
      ),
//      theme: GlobalConfig.themeData,
    );
  }

  /// 获取数据
   getTopicData() {
    NetUtils.get(WYConst.WYTopicURL).then((data) {
      print('topic.data.type = ${data.runtimeType}');
//          print('返回的频道 = $data');
      WYTopicModel model = WYTopicModel(data);
      setState(() {
        _wyTopicModel = model;
      });
    });
  }

  Widget _tabContainer() {
    // 如果没有数据或者请求失败就直接返回空页面
    if(_wyTopicModel == null || _wyTopicModel.code != 0) {
      return Center(
        child: FlatButton(
          onPressed: (){
            getTopicData();
          },
          child: Text('点击刷新页面'),
        ),
      );
    }

    Widget tabBarContainer = TabBar(
      isScrollable: true,
      unselectedLabelColor: Colors.grey,
      labelColor: Colors.orange, // 选中状态的颜色
      indicatorColor: Colors.orange, // 指示器的颜色
      indicatorWeight: 2.0, // 指示器的高度
      tabs: _wyTopicModel.tList.map((TTopic topic) {
        return Tab(
          text: topic.tname,
        );
      }).toList(), // <Widget>[ ],
    );

    Widget tabConttroller = DefaultTabController(
      length: _wyTopicModel.tList.length,
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
              children: _wyTopicModel.tList.map((TTopic topic) {
                return WYNewsListPage(
                  id: topic.tid,
                  name: topic.tname,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
    return tabConttroller;
  }

  /// 空页面显示
  Widget _buildEmpty() {}

  /// 上拉加载更多
  Widget _buildProgressIndicator() {}
}
