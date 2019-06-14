import 'package:flutter/material.dart';
import 'package:firstflutter/global_config.dart';
import 'article.dart';
import 'reply_page.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:package_info/package_info.dart';
import 'package:firstflutter/widget/package_path.dart';
import 'dart:convert';

class Follow extends StatefulWidget {
//  @override
//  _FollowPageState createState() => _FollowPageState();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FollowPageState();
  }
}

class _FollowPageState extends State<Follow> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 5),
        child: Column(
          children: <Widget>[
            this.wordsCard(articleList[0]),
            this.wordsCard(articleList[1]),
            this.wordsCard(articleList[2]),
            Icon(
              Icons.headset,
              size: 40,
            ),
            this.wordsCard(articleList[3]),
          ],
        ),
      ),
    );
  }

  Widget wordsCard(Article article) {
    Widget markWidge;
    if (article.imageUrl == null) {
      markWidge = Text(
        article.mark,
        style: TextStyle(height: 1.3, color: GlobalConfig.fontColor),
      );
    } else {
      markWidge = Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              child: Text(
                article.mark,
                style: TextStyle(
                  height: 1.3,
                  color: GlobalConfig.fontColor,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: AspectRatio(
              aspectRatio: 3.0 / 2.0,
              child: Container(
                foregroundDecoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(article.imageUrl),
                      centerSlice: Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(6.0))),
              ),
            ),
          )
        ],
      );
    }
    return Container(
      color: GlobalConfig.cardBackgroundColor,
      margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: FlatButton(
          onPressed: () {
            print('点击了头像');
            _getLocalFile();
          },
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(article.headUrl),
                        radius: 11.0,
                      ),
                    ),
                    Text(
                      "  " +
                          article.user +
                          "  " +
                          article.action +
                          " . " +
                          article.time,
                      style: TextStyle(color: GlobalConfig.fontColor),
                    )
                  ],
                ),
                padding: const EdgeInsets.only(top: 10.0),
              ),
              Container(
                child: Text(
                  article.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      height: 1.3,
                      color: Colors.black),
                ),
                margin: EdgeInsets.only(top: 6.0, bottom: 2.0),
                alignment: Alignment.topLeft,
              ),
              Container(
                child: markWidge,
                margin: EdgeInsets.only(top: 6.0),
                alignment: Alignment.topLeft,
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      article.argreNum.toString() +
                          " 赞同 " +
                          article.commentNum.toString() +
                          "评论",
                      style: TextStyle(color: GlobalConfig.fontColor),
                    )),
                    PopupMenuButton(
                      icon: Icon(
                        Icons.linear_scale,
                        color: GlobalConfig.fontColor,
                      ),
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuItem<String>>[
                            PopupMenuItem<String>(
                              value: '选项一的值',
                              child: Text('屏蔽这个问题'),
                            ),
                            PopupMenuItem<String>(
                              value: '选项二的值',
                              child: Text('取消关注'),
                            ),
                            PopupMenuItem<String>(
                              value: '选项三的值',
                              child: Text('举报用户'),
                            ),
                          ],
                    )
                  ],
                ),
                padding: const EdgeInsets.only(),
              )
            ],
          )),
    );
  }

  Future<File> _getLocalFile() async {
//    var tempDir = await getTemporaryDirectory();
//    print("tempDir = $tempDir");
//     Directory curren = Directory.current;
//    print("curren = $curren");

    PackagePath testpack = await PackagePath.fromPlatform();

    var bundlePath = testpack.rootDirectory;
    print("bundlePath = $bundlePath");

    var configpath = testpack.AppConfigPath;

    print("configpath = $configpath");

    var parma = testpack.packageConfig;

    print("parma = $parma");

    /// 根据文件路径读取json数据
    try {
      final file = await File(configpath);
      String str = await file.readAsString();
      Map testparam = jsonDecode(str);
      print("在flutter中解析的结果=$testparam");
    } catch (e) {
      print("解析数据失败 $e");
    }
  }
//  Directory().path
}
