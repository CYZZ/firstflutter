import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firstflutter/global_config.dart';
import 'package:flutter/widgets.dart';
import 'package:firstflutter/home/newsDetail_page.dart';

class IdeaPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _IdeaPageState();
  }
}

class _IdeaPageState extends State<IdeaPage> with WidgetsBindingObserver {


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    print('当前的状态state1=$state');
//    super.didChangeAppLifecycleState(state);
    print('当前的状态state2=$state');
    if(state == AppLifecycleState.resumed) {

    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('想法'),
          centerTitle: true,
          leading: Icon(Icons.menu),
          actions: <Widget>[
            Icon(Icons.ondemand_video),
            Icon(Icons.headset),
          ],
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: FlatButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NewsDetailPage(
                              id: 'https://github.com/CarGuo/GSYFlutterBook/blob/master/Flutter-2.md',
                            )));
                  },
                  icon: Icon(Icons.access_alarm),
                  label: Text('随便'),
                ),
              ),
              Expanded(
                child: Text("1111",
                    style: TextStyle(
                      backgroundColor: Colors.lightBlueAccent,
                    )),
                flex: 3,
              ),
              Expanded(
                child: Text("22222",
                    style: TextStyle(
                      backgroundColor: Colors.lightGreenAccent,
                    )),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _getBottomItem(Icons.star, '1000'),
                  _getBottomItem(Icons.email, '2000'),
                  _getBottomItem(Icons.call, '3000'),
                ],
              ),
            ],
          ),
        ),
      ),
//      theme: GlobalConfig.themeData,
    );
  }

  _getBottomItem(IconData icon, String text) {
    /// 充满Row横向的布局
    return Expanded(
      flex: 1,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 16.0,
              color: Colors.grey,
            ),
            // 间隔
            Padding(
              padding: EdgeInsets.only(left: 5.0),
            ),
            Text(
              text,
              // 设置字体样式
              style: TextStyle(color: Colors.grey, fontSize: 14.0),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            )
          ],
        ),
      ),
    );
  }
}
