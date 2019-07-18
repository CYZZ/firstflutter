//import 'package:firstflutter/home/news_model.dart';
import 'package:flutter/material.dart';
import 'package:firstflutter/util/NetUtils.dart';
import 'WYConst.dart';
import 'wynews_model.dart';

//import 'wynewsdetail_page.dart';
import 'wynews_webpage.dart';

class WYNewsListPage extends StatefulWidget {
  final String id;
  final String name;

  WYNewsListPage({Key key, this.id, this.name}) : super(key: key);

  @override
  _WYNewsListPageState createState() =>
      _WYNewsListPageState(id: this.id, name: this.name);
}

class _WYNewsListPageState extends State<WYNewsListPage> {
  String id;
  String name;

  _WYNewsListPageState({Key key, this.id, this.name});

  List<WYNewsModel> _newsModels = [];
  int curIndex = 0;
  final ScrollController _scrollController =
      ScrollController(keepScrollOffset: false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      var maxscroll = _scrollController.position.maxScrollExtent;
      var pixels = _scrollController.position.pixels;
      if (maxscroll == pixels) {
        curIndex += 10;
        getNewsListData(true);
      }
    });
    getNewsListData(false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
//      child: _mainContainer(),
      child: Center(
        child: _mainContainer(),
      ),
    );
  }

  /// 获取新闻列表数据
  /// [isLoadMore]是否上拉加载更多
  getNewsListData(bool isLoadMore) {
    String url =
        "${WYConst.WYBaseURL}/dlist/article/dynamic?from=${this.id}&devId=04t9kC29sLRKF4SBKuUzubT6oPF82ZeVgdqa23lqvQsyuYRWeXA6QrJnzCTrtWxf&version=56.0&canal=appstore&offset=$curIndex&size=10&fn=1";
//    print('新闻列表链接=$url');
    NetUtils.get(url).then((data) {
      print('data.type = ${data.runtimeType}');
      print('data = $data');

      List jsonList = data["${this.id}"];
      print('jsonList.length ======${jsonList.length}');

      List<WYNewsModel> currenData = jsonList.map((jsonRes) {
        return WYNewsModel.fromJson(jsonRes);
      }).toList();

      // 刷新页面
      setState(() {
        if (isLoadMore == false) {
          _newsModels = currenData;
        } else {
          _newsModels.addAll(currenData);
        }
      });
//      print('总共有多少列表 _newsModels = $_newsModels, ');
//          length = ${testList.length}'
    });
  }

  Widget _mainContainer() {
    Widget listView = ListView.builder(
      itemBuilder: (context, index) => renderRow(index),
      itemCount: _newsModels.length,
      controller: _scrollController,
    );

    Widget container = RefreshIndicator(
      child: listView,
      onRefresh: _pullToRefresh,
    );

    return container;
  }

  Future<void> _pullToRefresh() async {
    curIndex = 0;
    getNewsListData(false);
  }

  Widget renderRow(index) {
    WYNewsModel model = _newsModels[index];

    // 主标题
    Widget titleRow = Row(
      children: <Widget>[
        Expanded(
          child: Text(
            model.title,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );

    // 附加信息，source，time
    Widget timeRow = Row(
      children: <Widget>[
        Text(
          model.source,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
          child: Text(
            model.ptime,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ),
      ],
    );

    Widget rightImage = Container(
      margin: EdgeInsets.all(10.0),
      width: 120,
      height: 60,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(model.imgsrc),
        ),
      ),
    );

    Widget render() {
      if (model.imgextra?.isNotEmpty == true) {
        return Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10,top: 5,bottom: 5,right: 10),
              child: titleRow,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: AspectRatio(
                      aspectRatio: 16.0 / 9.0,
                      child: Image.network(model.imgsrc, fit: BoxFit.fill),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: AspectRatio(
                      aspectRatio: 16.0 / 9.0,
                      child: Image.network(model.imgextra[0]['imgsrc'],
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: AspectRatio(
                      aspectRatio: 16.0 / 9.0,
                      child: Image.network(model.imgextra[1]['imgsrc'],
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 10,top: 5,bottom: 5,right: 5),
              child: timeRow,
            ),
            Divider(
              height: 2.0,
              color: Colors.grey,
            ),
          ],
        );
      }
      return Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      titleRow,
                      timeRow,
                    ],
                  ),
                ),
              ),
              rightImage,
            ],
          ),
          Divider(
            height: 2.0,
            color: Colors.grey,
          ),
        ],
      );
    }

    return InkWell(
        child: render(),
        onTap: () {
          print('点击了cell，${model.imgsrc}， model.imgextra= ${model.imgextra}');
          Navigator.of(context).push(
            MaterialPageRoute(
//              builder: (ctx) => WYNewsDetailPage(
//                docid: model.docid,
//              ),
                builder: (context) => WYNewsWebPage(
                      docid: model.docid,
                    )),
          );
        });
//    return render;
  }
}
