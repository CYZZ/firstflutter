import 'package:flutter/material.dart';
import 'navigation_icon_view.dart';
import 'package:firstflutter/global_config.dart';
import 'package:firstflutter/home/home_page.dart';
import 'package:firstflutter/idea/idea_page.dart';
import 'package:firstflutter/market/market_page.dart';
import 'package:firstflutter/notice/notice_page.dart';
import 'package:firstflutter/my/my_page.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _IndexState();
  }
}

class _IndexState extends State<Index> with TickerProviderStateMixin {
  int _currentIndex = 0;
  List<NavigationIconView> _navigationViews;
  List<StatefulWidget> _pageList;
  StatefulWidget _currentPage;

  @override
  void initState() {
    // TODO: implement initState
    _navigationViews = <NavigationIconView>[
      NavigationIconView(
        icon: Icon(Icons.home),
        title: '首页',
        vsync: this,
      ),
      NavigationIconView(
        icon: Icon(Icons.shopping_cart),
        title: '购物',
        vsync: this,
      ),
      NavigationIconView(
        icon: Icon(Icons.question_answer),
        title: '想法',
        vsync: this,
      ),
      NavigationIconView(
        icon: Icon(Icons.notifications_active),
        title: '通知',
        vsync: this,
      ),
      NavigationIconView(
        icon: Icon(Icons.person),
        title: '我的',
        vsync: this,
      ),
    ];
    for (NavigationIconView view in _navigationViews) {
      view.controller.addListener(_rebuild);
    }

    _pageList = <StatefulWidget>[
      HomePage(),
      IdeaPage(),
      MarketPage(),
      NoticePage(),
      MyPage(),
    ];
    _currentPage = _pageList[_currentIndex];
  }

  void _rebuild() {
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    for (NavigationIconView view in _navigationViews) {
      view.controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final BottomNavigationBar bottomNavigationBar = BottomNavigationBar(
      items: _navigationViews
          .map((NavigationIconView navigationIconView) =>
              navigationIconView.item)
          .toList(),
      currentIndex: _currentIndex,
      fixedColor: Colors.blue,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _navigationViews[_currentIndex].controller.reverse();
          _currentIndex = index;
          _navigationViews[_currentIndex].controller.forward();
          _currentPage = _pageList[_currentIndex];
        });
      },
    );

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: _currentPage,
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
//      theme: GlobalConfig.themeData,
    );
  }
}
