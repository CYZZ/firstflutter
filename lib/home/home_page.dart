import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'follow.dart';
import 'hot.dart';
import 'package:dio/dio.dart';
import 'recommend.dart';
import 'news_model.dart';
import 'package:firstflutter/common/constant.dart';
import 'package:firstflutter/global_config.dart';
import 'package:firstflutter/widget/common_divider.dart';
import 'package:firstflutter/Model/zhihuModel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NewsStoriesModel> _normalDatas = List<NewsStoriesModel>();
  ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: barSearch(),
          bottom: TabBar(
            tabs: [
              Tab(
                text: '关注',
                child: attentionView(),
              ),
              Tab(
                text: '推荐',
              ),
              Tab(
                text: '热榜',
              )
            ],
          ),
        ),
        body: TabBarView(children: [
          Follow(),
          Recommend(),
          Hot(),
        ]),
      ),
    );
  }

  // 关注页面
  Widget attentionView() {
    var content;
    content = ListView.builder(
      itemBuilder: _attentionItem,
      itemCount: _normalDatas.length,
      physics: AlwaysScrollableScrollPhysics(),
      controller: _scrollController,
    );

    return content;
  }

  Widget _attentionItem(BuildContext context, int index) {
    final NewsStoriesModel item = _normalDatas[index];

    Widget widget;

    widget = _buildNormalItem(item);
    return widget;
  }

  Widget barSearch() {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
              child: FlatButton.icon(
                  onPressed: () {
                    print('点击了搜索按钮');
//                    AllNews.fromParams()
//                  AllNews.fromJson(jsonRes)
                  },
                  icon: Icon(
                    Icons.search,
                    color: GlobalConfig.fontColor,
                    size: 16,
                  ),
                  label: Text(
                    '请输入搜索关键字',
                    style: TextStyle(color: Colors.grey),
                  )))
        ],
      ),
    );
  }

  Widget _buildNormalItem(NewsStoriesModel item) {
    final String imgUrl = item.images[0];
    final String title = item.title;
    final int id = item.id;

    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.only(left: 12.0, right: 12.0),
        child: SizedBox(
          height: Constant.normalItemHeight,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w300),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 80.0,
                      width: 80.0,
                      child: Image.network(imgUrl),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CommonDivider.buildDivider(),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  loadNewsData() async {
    String url = 'https://news-at.zhihu.com/api/4/news/latest';

    Dio dio = DioFactory.getInstance().getDio();

    int code;
    String errorMsg;
    NewsModel newsStoriesModel;
    BaseModel<NewsModel> model;

    try {
      Response response = await dio.get(url);
      code = 200;
      if (response.statusCode == HttpStatus.ok) {
        print(response.data);
        String date = response.data['date'];
        List stories = response.data['stories'];
        List topStories = response.data['top_stories'];
        List<NewsTopStoriesModel> topStoriesList;

        List<NewsStoriesModel> storiesList = stories.map((model) {
          return NewsStoriesModel.fromJson(model);
        }).toList();
      }
    } catch (exception) {
      errorMsg = '您的网络似乎出了什么问题';
    } finally {
      model = BaseModel(code: code, errorMsg: errorMsg, data: newsStoriesModel);
    }
    return model;
  }
}

//总觉得怪怪的，但是打印出来确实是只有一个dio对象。。

class DioFactory {
  static Dio _dio;

  static DioFactory _instance;

  static DioFactory getInstance() {
    if (_instance == null) {
      _instance = new DioFactory._();
      _instance._init();
    }
    return _instance;
  }

  DioFactory._();

  _init() {
    _dio = new Dio();
  }

  getDio() {
    return _dio;
  }
}
