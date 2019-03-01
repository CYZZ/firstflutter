import 'package:flutter/material.dart';
import 'navigation_icon_view.dart';
import '../global_config.dart';
import 'package:firstflutter/home/home_page.dart';
import 'package:firstflutter/idea/idea_page.dart';
import 'package:firstflutter/market/market_page.dart';
import 'package:firstflutter/notice/notice_page.dart';
import 'package:firstflutter/my/my_page.dart';

class Index extends StatefulWidget {
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> with TickerProviderStateMixin {
  int _currentIndex = 0;
  List<NavigationIconView> _navigationViews;
  List<StatefulWidget> _pageList;
  StatefulWidget _currentPage;

  @override
  Widget build(BuildContext context) {
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
      theme: GlobalConfig.themeData,
    );
  }

  @override
  void initState() {
    super.initState();
    _navigationViews = <NavigationIconView>[
//      NavigationIconView(
//        icon: Icon(Icons.assessment),
//        title: Text('首页'),
//        vsync: this,
//      ),
      NavigationIconView(
        icon: Icon(Icons.library_music),
        title: Text('想法'),
        vsync: this,
      ),
      NavigationIconView(
        icon: Icon(Icons.shopping_cart),
        title: Text('市场'),
        vsync: this,
      ),
      NavigationIconView(
        icon: Icon(Icons.notifications_active),
        title: Text('通知'),
        vsync: this,
      ),
      NavigationIconView(
        icon: Icon(Icons.person),
        title: Text('我'),
        vsync: this,
      ),
    ];
    for (NavigationIconView view in _navigationViews) {
      view.controller.addListener(_rebuild);
    }

    _pageList = <StatefulWidget>[
//      HomePage(),
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
}
