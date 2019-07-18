import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WYNewsWebPage extends StatefulWidget {
  final String docid;

  WYNewsWebPage({Key key, this.docid}) : super(key: key);

  @override
  _WYNewsWebPageState createState() => _WYNewsWebPageState();
}

class _WYNewsWebPageState extends State<WYNewsWebPage> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: 'https://c.m.163.com/news/a/${widget.docid}.html',
      appBar: AppBar(
        title: Text('新闻详情'),

      ),
    );
//    return Container();
  }
}
