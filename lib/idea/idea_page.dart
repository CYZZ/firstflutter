import 'package:firstflutter/idea/model/gold_model.dart';
import 'package:firstflutter/idea/model/gold_network.dart';
import 'package:firstflutter/util/NetUtils.dart';
import 'package:firstflutter/widget/candle_stick.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firstflutter/wanandroid/ui/page/page_index.dart';
import 'package:firstflutter/common/constant.dart';

//import 'package:auto_size/auto_size.dart';
import 'package:base_library/base_library.dart';
import 'package:firstflutter/common/constant.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:base_library/base_library.dart';
import 'package:yzwidge_plugin/yzwidge_plugin.dart';

class IdeaPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _IdeaPageState();
  }
}

class _IdeaPageState extends State<IdeaPage> {
  GoldModel _goldModel;
  GoldModel _silverModel;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: FlatButton(
            onPressed: () {
              print('刷新数据');
              loadNetworkData();
            },
            child: Icon(
              Icons.list,
              color: Colors.white,
            ),
          ),
          title: Text('想法'),
        ),
        body: contentBody(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("这是在idea单独设置的");
            loadNetworkData();
          },
          tooltip: 'idea tips',
          child: Icon(Icons.message),
        ),
      ),
//      theme: GlobalConfig.themeData,
    );
  }

  Widget contentBody() {
    return Column(
      children: <Widget>[
        Container(
            margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Row(
              children: <Widget>[
                Text(
                  'Gold最高价：',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '${_goldModel?.data?.mostHigh}',
                  style: TextStyle(fontSize: 20),
                )
              ],
            )),
        Container(
            margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Row(
              children: <Widget>[
                Text(
                  'Gold最低价：',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '${_goldModel?.data?.mostLow}',
                  style: TextStyle(fontSize: 20),
                )
              ],
            )),
        Container(
            margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Row(
              children: <Widget>[
                Text(
                  'Gold开始价：',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '${_goldModel?.data?.open}',
                  style: TextStyle(fontSize: 20),
                )
              ],
            )),
        Container(
            margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Row(
              children: <Widget>[
                Text('Gold最新价：', style: TextStyle(fontSize: 20)),
                Text(
                  '${_goldModel?.data?.close}',
                  style: TextStyle(fontSize: 20, color: Colors.blueAccent),
                )
              ],
            )),
        Divider(
          height: 1.0,
          color: Colors.grey,
        ),
        Container(
            margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Row(
              children: <Widget>[
                Text(
                  'Silver最高价：',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '${_silverModel?.data?.mostHigh}',
                  style: TextStyle(fontSize: 20),
                )
              ],
            )),
        Container(
            margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Row(
              children: <Widget>[
                Text(
                  'Silver最低价：',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '${_silverModel?.data?.mostLow}',
                  style: TextStyle(fontSize: 20),
                )
              ],
            )),
        Container(
            margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Row(
              children: <Widget>[
                Text(
                  'Silver开始价：',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '${_silverModel?.data?.open}',
                  style: TextStyle(fontSize: 20),
                )
              ],
            )),
        Container(
            margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Row(
              children: <Widget>[
                Text(
                  'Silver最新价：',
                  style: TextStyle(fontSize: 20),
                ),
                Text('${_silverModel?.data?.close}',
                    style: TextStyle(fontSize: 20, color: Colors.blueAccent))
              ],
            )),
        Container(
            margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: Row(
              children: <Widget>[
                Text(
                  '比值：',
                  style: TextStyle(fontSize: 20),
                ),
                Text(calculatorRatio(),
                    style: TextStyle(fontSize: 20, color: Colors.blueAccent))
              ],
            )),
        Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: CustomPaint(
                painter: goldCandleStick(),
                size: Size(30, 100),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: CustomPaint(
                painter: silverCandleStick(),
                size: Size(30, 100),
              ),
            )
          ],
        )
      ],
    );
  }

  CandleStick goldCandleStick() {
    if (_goldModel != null) {
      return CandleStick(_goldModel.data.mostHigh, _goldModel.data.mostLow,
          _goldModel.data.open, _goldModel.data.close);
    } else {
      return CandleStick(20, 20, 20, 20);
    }
  }

  CandleStick silverCandleStick() {
    if (_silverModel != null) {
      return CandleStick(_silverModel.data.mostHigh, _silverModel.data.mostLow,
          _silverModel.data.open, _silverModel.data.close);
    } else {
      return CandleStick(20, 20, 20, 20);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadNetworkData();
  }

  loadNetworkData() {
    GoldNetwork.getGoldValue((model) {
      _goldModel = model;
      setState(() {});
    });
    GoldNetwork.getSilverValue((model) {
      _silverModel = model;
      setState(() {});
    });
  }

  String calculatorRatio() {
    if (_goldModel?.data?.close != null && _silverModel?.data?.close != null) {
      return (_goldModel.data.close / _silverModel.data.close)
          .toStringAsFixed(3);
    } else {
      return "0";
    }
  }
}
