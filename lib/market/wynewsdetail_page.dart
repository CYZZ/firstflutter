//import 'dart:convert';
import 'dart:core';
import 'dart:io';
//import 'package:firstflutter/market/wynewsdetail_model.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:firstflutter/util/NetUtils.dart';
import 'WYConst.dart';
import 'package:path_provider/path_provider.dart';
import 'wynewsdetail_model.dart';
//import 'package:flutter/services.dart';

class WYNewsDetailPage extends StatefulWidget {
  final String docid;

  WYNewsDetailPage({Key key, this.docid}) : super(key: key);

  @override
  _WYNewsDetailPageState createState() => _WYNewsDetailPageState();
}

class _WYNewsDetailPageState extends State<WYNewsDetailPage> {
//  FlutterWebviewPlugin _webviewPlugin = FlutterWebviewPlugin();

  String locHtmlUrl = 'https:';
  Map detailData = {'data': '随便看看'};
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    loadDetailData();
    reloadUrl();

  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: locHtmlUrl,
      allowFileURLs: true,
      withLocalUrl: true,
      appBar: AppBar(
        title: Text('新闻详情'),
        iconTheme: IconThemeData(color: Colors.white),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              loadDetailData();
              reloadUrl();
//            initState();
            },
            child: Icon(Icons.error),
          ),
        ],
      ),
      withZoom: false,
      withLocalStorage: true,
      withJavascript: true,
    );
  }

  loadDetailData() async {
//    https://c.m.163.com/nc/article/preload/EI4ESVV9000189FH/full.html
    String url =
        '${WYConst.WYBaseURL}/nc/article/preload/${this.widget.docid}/full.html';
    print('当前即将加载的新闻url=$url');
    Map data = await NetUtils.get(url);
    print('当前新闻的详情 dataType == ${data.runtimeType}');
    WYNewsDetailModel model = WYNewsDetailModel(data[this.widget.docid]);

    print('当前的图片数组= model.img = ${model.img}');
    await writeHTMLString(getHtmlString(model));

    reloadUrl();
//    setState(() {});
  }

  // 刷新url
  reloadUrl() async {
    String path = await localPath();
    File file = localHTMLFile(path);

    locHtmlUrl = file.path;
    print('locHtmlUrl = $locHtmlUrl');
    setState(() {
      FlutterWebviewPlugin().reload();
    });
  }

  // TODO: 文件相关操作
  /// 获取文档路径
  Future<String> localPath() async {
    try {
      Directory dir = await getApplicationDocumentsDirectory();
      return dir.path;
    } catch (e) {
      print("获取文件路径失败,$e");
      return '';
    }
  }

  /// 获取存储的html文件File
  File localHTMLFile(String path) {
    return File('$path/wyNews.html');
  }

  /// 从沙盒读取html文件
//  Future<String> readHTMLFile() async {
//    try {
//      final file = await localHTMLFile(await localPath());
//      String htmlStr = await file.readAsString();
//      return htmlStr;
//    } catch (e) {
//      print(e);
//      return '';
//    }
//  }

  // 写入HTML字符串到沙盒
  Future<void> writeHTMLString(String obj) async {
    try {
      final file = localHTMLFile(await localPath());
      file.writeAsString(obj);
    } catch (e) {
      print(e);
    }
  }

  /// 拼接整个的html字符串
  String getHtmlString(WYNewsDetailModel model) {
    String html = "<html>";
    html += "<head>";
//    html += "<link rel=\"stylesheet\" href=\"%@\">";
    html += "<style type=\"text/css\">";
    html += " html {font-size:300%;}"; /*10 ÷ 16 × 100% = 62.5%*/
    html +=
        ".title { text-align:left; font-size:1.4rem; font-weight:bold; color:black; margin-left:1rem;}";
    html +=
        ".time { text-align:left; font-size:1.1rem; color:gray; margin-top:0.5rem; margin-bottom:0.5rem; margin-left:1rem; }";
    html += ".img-parent { text-align:center; margin-bottom:10rem;}";
    html += "</style>";
    html +=
        "<meta http-equiv=\"content-type\" content=\"text/html;charset=utf-8\">";
    html += "</head>";
    html += "<body style=\"background:#f6f6f6\">";
    html += this.getBodyString(model);
    html += "</body>";
    html += "</html>";

//   rootBundle.loadString("lib/market/wynewsDetails.css").then((value){
//     print('rootBundle.loadString = $value}');
//   });
    return html;
  }

  /// 拼接html的body
  String getBodyString(WYNewsDetailModel model) {
    String body = "";
    body = "<div class=\"title\">${model.title}</div>";
    body += "<div class=\"title\">${model.ptime}</div>";
    if (model.body != null) {
      body += model.body;
    }

    for (imgDetail detail in model.img) {
      print('detailimage = $detail');

      String imgHtml = "<div class=\"img-parent\">";
      imgHtml +=
          "<img onload=\"this.onclick = function() {}\" width=\"${detail.imgWidth}\" height=\"${detail.imgHeight}\" src=\"${detail.src}\">";
      imgHtml += "</div>";

      body = body.replaceAll(RegExp(detail.ref), imgHtml);
    }

    String test1 = "chiyuze 789 chiyuze 123";

    String test2 = test1.replaceAll(RegExp("chiyuze"), "cyz");

    print("test1测试字符串 = $test1, 转换后的test2 = $test2");
    return body;
  }
}
