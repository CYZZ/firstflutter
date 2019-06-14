import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firstflutter/util/NetUtils.dart';
import 'package:firstflutter/Api/Api.dart';
import 'dart:convert';
import 'package:firstflutter/common/constant.dart';
import 'package:firstflutter/widget/slide_view.dart';
import 'newsDetail_page.dart';
import 'package:firstflutter/widget/common_endline.dart';
import 'package:firstflutter/widget/slideview_indicator.dart';

final slideViewIndicatorStateKey = GlobalKey<SlideViewIndicatorState>();

class NewsListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _NewsListPageState();
  }
}

class _NewsListPageState extends State<NewsListPage> {
  final ScrollController _controller = ScrollController();
  final TextStyle titleTextStyle = TextStyle(fontSize: 15.0);
  final TextStyle subtitleStytle = TextStyle(
    color: const Color(0xffb5bdc0),
    fontSize: 12.0,
  );

  var listData;
  var slideData;
  var curPage = 1;
  SlideView slideView;
  var listTotalSize = 0;
  SlideViewIndicator indicator;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      var maxscroll = _controller.position.maxScrollExtent;
      var pixels = _controller.position.pixels;
      if (maxscroll == pixels && listData.length < listTotalSize) {
        curPage++;
        getNewsList(true);
      }
    });
    if (listData != null) {
      print('当前的listdata ！= null');
      return;
    }
    print('当前的listdata = ${listData}');
    getNewsList(false);
  }

  Future<Null> _pullToRefresh() async {
    curPage = 1;
    getNewsList(false);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // 无数据时显示Loading
    if (listData == null) {
      return new MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            leading: FlatButton(
              onPressed: () {
                print('展示列表');
              },
              child: Icon(
                Icons.list,
                color: Colors.white,
              ),
            ),
            title: Text('资讯'),
          ),
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
//      theme: GlobalConfig.themeData,
      );
    } else {
      // 有数据时，显示ListView
      Widget listView = ListView.builder(
        itemBuilder: (context, index) => renderRow(index),
        itemCount: listData.length * 2,
        controller: _controller,
      );

      return new MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            leading: FlatButton(
              onPressed: () {
                print('展示列表');
                Scaffold.of(context).openDrawer();
              },
              child: Icon(
                Icons.list,
                color: Colors.white,
              ),
            ),
            title: Text('资讯列表'),
            actions: <Widget>[Icon(Icons.call), Icon(Icons.headset_off)],
          ),
          body: Center(
            child: RefreshIndicator(
              child: listView,
              onRefresh: _pullToRefresh,
            ),
          ),
        ),
//      theme: GlobalConfig.themeData,
      );

//      return RefreshIndicator(child: listView, onRefresh: _pullToRefresh);
    }
//    return null;
  }

  ///* 获取新闻列表数据
  ///<h1>我是一个标题</h1>
  /// [isLoadMore] 是否是上拉加载更多
  getNewsList(bool isLoadMore) {
    String url = Api.newsList;
    url += "?pageIndex=1$curPage&pageSize=10";
    NetUtils.get(url).then((data) {
//      print('收到的数据data = $data');
      if (data != null) {
        // 将接口返回的json字符串解析为map类型
        print("(data is Map) = ${(data is Map)}");

        Map<String, dynamic> map = (data is Map) ? data : json.decode(data);

        if (map['code'] == 0) {
          //成功
          var msg = map['msg'];
          listTotalSize = msg['news']['total'];
          // data为数据内容，其中包括slide和news两部分，分别表示头部轮播图数据和下面的列表数据
          var _listData = msg['news']['data'];
          var _slideData = msg['slide'];
          setState(() {
            if (!isLoadMore) {
              // 不是加载更多，是下拉刷新
              listData = _listData;
              slideData = _slideData;
            } else {
              // 上拉加载更多需要拼接数据
              List list1 = List();
              list1.addAll(listData);
              list1.addAll(_listData);
              // 判断是否有更多数据，没有就要显示"没有更多数据"
              if (list1.length >= listTotalSize) {
                list1.add(Constant.endLineTag);
              }
              // 给列表数据赋值
              listData = list1;
              // 轮播图数据
              slideData = _slideData;
            }
            initSlider();
          });
        }
      }
    });
  }

  void initSlider() {
    indicator = SlideViewIndicator(
      slideData.length,
      key: slideViewIndicatorStateKey,
    );
    slideView = SlideView(
      slideData,
      indicator,
      slideViewIndicatorStateKey,
    );
  }

  Widget renderRow(index) {
    if (index == 0) {
      return Container(
        height: 180.0,
        child: Stack(
          children: <Widget>[
            slideView,
            Container(
              alignment: Alignment.bottomCenter,
              child: indicator,
            )
          ],
        ),
      );
    }

    index -= 1;
    if (index.isOdd) {
      // 单位奇数的时候加入一行分割线
      return Divider(
        height: 1.0,
        indent: 5,
      );
    }
    index = index ~/ 2;
    var itemData = listData[index];
    if (itemData is String && itemData == Constant.endLineTag) {
      return CommonEndLine();
    }
    var titleRow = Row(
      children: <Widget>[
        Expanded(
            child: Text(
          itemData['title'],
          style: titleTextStyle,
        ))
      ],
    );

    var timeRow = Row(
      children: <Widget>[
        Container(
          width: 20.0,
          height: 20.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xffececec),
            image: DecorationImage(
              image: NetworkImage(itemData['authorImg']),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: const Color(0xffececec),
              width: 2.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          child: Text(
            itemData['timeStr'],
            style: subtitleStytle,
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                "${itemData['commCount']}",
                style: subtitleStytle,
              ),
              Image.asset('./images/ic_comment.png', width: 16.0, height: 16.0),
            ],
          ),
          flex: 1,
        )
      ],
    );
    var thumbImageUrl = itemData['thumb'];
    var thumbImage = Container(
      margin: const EdgeInsets.all(10.0),
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xffececec),
          image: DecorationImage(
            image: ExactAssetImage('./images/ic_img_default.jpg'),
            fit: BoxFit.cover,
          ),
          border: Border.all(
            color: const Color(0xffececec),
            width: 2.0,
          )),
    );
    if (thumbImageUrl != null && thumbImageUrl.length > 0) {
      thumbImage = Container(
        margin: EdgeInsets.all(10.0),
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xffececec),
          image: DecorationImage(
            image: NetworkImage(thumbImageUrl),
            fit: BoxFit.cover,
          ),
          border: Border.all(
            color: Color(0xffececec),
            width: 2.0,
          ),
        ),
      );
    }

    var row = Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                titleRow,
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                  child: timeRow,
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(6.0),
          child: Container(
            width: 100.0,
            height: 80.0,
            color: Color(0xffececec),
            child: Center(
              child: thumbImage,
            ),
          ),
        )
      ],
    );

    return InkWell(
      child: row,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => NewsDetailPage(
                  id: itemData['detailUrl'],
                ),
          ),
        );
      },
      onLongPress: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('详细描述'),
                  content: Text(
                    itemData['summary'],
                    style: TextStyle(fontSize: 15),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('确定'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ));
      },
    );
  }
}
