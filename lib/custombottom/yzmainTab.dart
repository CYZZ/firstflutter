import 'package:flutter/material.dart';
import 'package:firstflutter/home/newsList_page.dart';
import 'package:firstflutter/idea/idea_page.dart';
import 'package:firstflutter/market/market_page.dart';
import 'package:firstflutter/notice/notice_page.dart';
import 'package:firstflutter/my/my_page.dart';
import 'package:firstflutter/global_config.dart';
import 'package:firstflutter/index/navigation_icon_view.dart';

class MainTabbar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainTabbarState();
  }
//  @override
//  _MainTabbarState createState() => _MainTabbarState();
}

class _MainTabbarState extends State<MainTabbar> with TickerProviderStateMixin {
  int _currentIndex = 2; // 默认选中中间的tab
  List<StatefulWidget> _pageList;
  List<NavigationIconView> _navigationIconViews;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _pageList = <StatefulWidget>[
      NewsListPage(),
      MarketPage(),
      IdeaPage(),
      NoticePage(),
      MyPage(),
    ];

    _navigationIconViews = <NavigationIconView>[
      NavigationIconView(
        icon: Icon(Icons.fiber_new),
        title: '资讯',
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
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavigationBar = BottomNavigationBar(
      items: _navigationIconViews
          .map((NavigationIconView navView) => navView.item)
          .toList(),
      currentIndex: _currentIndex,
      fixedColor: Colors.blue,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );

    return MaterialApp(
      home: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: _pageList,
        ),
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: FloatingActionButton(onPressed: (){
          print('点击了悬浮按钮');
        },
        tooltip: 'chiyz',
        child: Icon(Icons.call),),
      ),
      theme: GlobalConfig.themLight,
    );
  }
}
