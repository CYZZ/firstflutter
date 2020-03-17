//import 'package:firstflutter/home/news_model.dart';
import 'package:firstflutter/notice/model/gold_td_list.dart';
import 'package:flutter/material.dart';
import 'package:firstflutter/util/NetUtils.dart';

Widget goldTdView(List<GoldTdData> goldData) {
  // 默认样式
  TextStyle normalStyle = TextStyle(color: Colors.grey, fontSize: 12);

  Widget renderRow(index) {
    GoldTdData model = goldData[index];
    // 主标题
    Widget titleRow = Row(
      children: <Widget>[
        Expanded(
          child: Text(
            model.typeName,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );

    // 附加信息，source，time
    Widget bankInRow = Text(
      "银行买入价：${model.bankInPrice}",
      style: normalStyle,
    );
    Widget bankOutRow = Text(
      "银行卖出价：${model.bankOutPrice}",
      style: normalStyle,
    );
    Widget bankMiddleRow = Text(
      "中间价：${model.middlePrice}",
      style: normalStyle,
    );
    Widget minPriceRow = Text(
      "最低价：${model.minPrice}",
      style: normalStyle,
    );
    Widget maxPriceRow = Text(
      "最高价：${model.maxPrice}",
      style: normalStyle,
    );
    Widget tPriceRow = Text(
      "最新价：${model.tPrice}",
      style: normalStyle,
    );
    Widget tPercentRow = Text(
      "涨跌幅：${model.tPercent}",
      style: normalStyle,
    );
    Widget tCjlRow = Text(
      "${model.tCjl}",
      style: normalStyle,
    );
    Widget tOpenPriceRow = Text(
      "开始价：${model.tOpenPrice}",
      style: normalStyle,
    );
    Widget tClosePriceRow = Text(
      "昨收：${model.tClosePrice}",
      style: normalStyle,
    );

    Widget rightCandle = Container(
      margin: EdgeInsets.all(10.0),
      width: 120,
      height: 60,
      child: Icon(Icons.print),
    );

    Widget render() {
      if (model.tPrice == null) {
        return Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        titleRow,
                        bankInRow,
                        bankOutRow,
                        bankMiddleRow,
                        minPriceRow,
                        maxPriceRow,
                      ],
                    ),
                  ),
                ),
                rightCandle,
              ],
            ),
            Divider(
              height: 2.0,
              color: Colors.grey,
            ),
          ],
        );
      } else {
        return Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        titleRow,
                        tPriceRow,
                        tPercentRow,
                        tOpenPriceRow,
                        tClosePriceRow,
                        minPriceRow,
                        maxPriceRow,
                      ],
                    ),
                  ),
                ),
                rightCandle,
              ],
            ),
            Divider(
              height: 2.0,
              color: Colors.grey,
            ),
          ],
        );
      }
    }

    return InkWell(
        child: render(),
        onTap: () {
          print('点击了cell');
        });
  }

  Widget _mainContainer() {
    Widget listView = ListView.builder(
      itemBuilder: (context, index) => renderRow(index),
      itemCount: goldData.length,
    );
    return listView;
  }

  return _mainContainer();
}
