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

  final ScrollController _scrollController = ScrollController();

//  @override
//  void initState() {
//    // TODO: implement initState
//    // 判断当前滑动位置是不是到达了底部，触发加载更多
//    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
//
//    }
//    super.initState();
//  }

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
        ),
        body: Center(
          child: null,
        ),
      ),
//      theme: GlobalConfig.themeData,
    );
  }

  /// 空页面显示
  Widget _buildEmpty() {

  }

  /// 上拉加载更多
  Widget _buildProgressIndicator() {

  }
}