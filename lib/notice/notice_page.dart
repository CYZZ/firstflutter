import 'package:flutter/material.dart';
import 'package:firstflutter/global_config.dart';
import 'scoped/under_page.dart';
import 'scoped/blocs/bloc_provider.dart';

class NoticePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NoticePageState();
  }
}

class _NoticePageState extends State<NoticePage> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider().bloc;
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('通知'),
          actions: <Widget>[
            FlatButton(
              child: Icon(Icons.skip_next),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => UnderPage()));
              },
            )
          ],
        ),
        body: Center(
          child: StreamBuilder<int>(
              stream: bloc.stream,
              initialData: bloc.value,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                return Text('你已经点击了-${snapshot.data} 次数');
              }),
        ),
//        floatingActionButton: FloatingActionButton(
//          onPressed: () {
//            Navigator.of(context)
//                .push(MaterialPageRoute(builder: (context) => UnderPage()));
//          },
//          child: Icon(Icons.navigate_next),
//        ),
      ),
    );
  }
}
