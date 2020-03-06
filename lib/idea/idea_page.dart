import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firstflutter/wanandroid/ui/page/page_index.dart';
import 'package:firstflutter/common/constant.dart';
import 'package:auto_size/auto_size.dart';
import 'package:base_library/base_library.dart';
import 'package:firstflutter/common/constant.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:base_library/base_library.dart';

class IdeaPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _IdeaPageState();
  }
}

class _IdeaPageState extends State<IdeaPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text('想法'),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _initAsync();

  }

  void _init() {

  }

  void _loadLocale() {

  }

  void _initAsync() async {
    await SpUtil.getInstance();
    if (!mounted) return;
    _init();
    _loadLocale();
  }

  void _initListener() {
    ///warning
    ///

  }
}
