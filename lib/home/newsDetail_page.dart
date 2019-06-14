import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class NewsDetailPage extends StatefulWidget {
  final String id;

  NewsDetailPage({Key key, this.id}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewsDetailPageState(id: this.id);
  }
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  String id;
  bool loaded = false;
  String detailDataStr;
  final webviewplugin = FlutterWebviewPlugin();

  _NewsDetailPageState({Key key, this.id});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    webviewplugin.onStateChanged.listen((state) {
      print("webview State = ${state.type}");
      if (state.type == WebViewState.finishLoad) {
        // 加载完成了
        setState(() {
          loaded = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Widget> titleContent = [];
    titleContent.add(Text(
      "咨询详情",
      style: TextStyle(color: Colors.white),
    ));
    if (!loaded) {
      titleContent.add(CupertinoActivityIndicator());
    }
    titleContent.add(Container(
      width: 50.0,
    ));
    return WebviewScaffold(
      url: this.id,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: titleContent,
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      withZoom: false,
      withLocalStorage: true,
      withJavascript: true,
    );
//    return null;
  }
}
