import 'package:flutter/material.dart';
import 'package:firstflutter/home/newsDetail_page.dart';
import 'slideview_indicator.dart';

class SlideView extends StatefulWidget {
  final List data;
  final SlideViewIndicator slideViewIndicator;
  final GlobalKey<SlideViewIndicatorState> globalKey;

  SlideView(this.data, this.slideViewIndicator, this.globalKey);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SlideViewState();
  }
}

class SlideViewState extends State<SlideView>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  List slideData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slideData = this.widget.data;
    tabController = TabController(
      length: slideData == null ? 0 : slideData.length,
      vsync: this,
    );
    tabController.addListener(() {
      this.widget.globalKey.currentState.setSelectedIndex(tabController.index);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }

  Widget generateCard() {
    return Card(
      color: Colors.blue,
      child: Image.asset(
        "images/ic_avatar_default.png",
        width: 20.0,
        height: 20.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    List<Widget> items = [];
    if (slideData != null && slideData.length > 0) {
      for (var i = 0; i < slideData.length; i++) {
        var item = slideData[i];
        var imgUrl = item['imgUrl'];
        var title = item['title'];
        var detailUrl = item['detailUrl'];
        var summary = item['summary'];
        items.add(GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => NewsDetailPage(id: detailUrl),
              ),
            );
          },
          child: Stack(
            children: <Widget>[
              Image.network(
                imgUrl,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: Color(0x50000000),
                child: Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
//                color: Color(0x60000000),
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Color(0x10000000),
                  padding: EdgeInsets.all(6.0),
                  child: Text(
                    summary,
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
      }
    }
    return TabBarView(
      controller: tabController,
      children: items,
    );
  }
}
