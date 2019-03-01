import 'package:flutter/material.dart';
import 'package:firstflutter/global_config.dart';
import 'package:flutter/services.dart';

class IdeaPage extends StatefulWidget {
  @override
  _FollowPageState createState() => _FollowPageState();
}

class _FollowPageState extends State<IdeaPage> {
  // 创建一个geinative的channel（类似iOS的通知）
  static const methodChannel = MethodChannel('com.page.your/native_get');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  _iOSPushToVC() async {
    await methodChannel.invokeMapMethod('iOSFlutter', '参数');
  }

  _iOSPushToVC1() async {
    Map<String, dynamic> map = {
      'code': '200',
      'data': [1, 2, 3]
    };
    await methodChannel.invokeMapMethod('iOSFlutter1', map);
  }

  _iOSPushToVC2() async {
    var result;
    try {
      result = await methodChannel.invokeMapMethod('iOSFlutter2', '参数3');
    } on PlatformException {
      result = 'error';
    }
    print('iOS原生返回的result = ' + result);
//    if (result is Map) {
//      print(result);
//      showModalBottomSheet(
//          context: context,
//          builder: (BuildContext context) {
//            return new Container(
//              child: new Center(
//                child: new Text(
//                  result['hello'],
//                  style: new TextStyle(color: Colors.brown),
//                  textAlign: TextAlign.center,
//                ),
//              ),
//              height: 40.0,
//            );
//          });
//    }
  }

  Widget barSearch() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                _iOSPushToVC();
              },
              child: Text('方法1'),
            ),
            FlatButton(
              onPressed: () {
                _iOSPushToVC1();
              },
              child: Text('方法2'),
            ),
            FlatButton(
              onPressed: () {
                _iOSPushToVC2();
              },
              child: Text('方法3'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text('想法'),
          ),
          body: barSearch(),
        ),
        theme: GlobalConfig.themeData);
  }
}
