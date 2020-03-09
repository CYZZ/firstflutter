import 'package:firstflutter/idea/model/gold_model.dart';
import 'package:firstflutter/util/NetUtils.dart';
import 'package:flutter/cupertino.dart';

typedef GoldDataCallBack = void Function(GoldModel model);

class GoldNetwork {
  // 获取gold数据
  static getGoldValue(GoldDataCallBack callBack) async {
    NetUtils.get(
            'http://goldayapp.golday999.com/goldayapp/getPriceDataOfDay/LLG')
        .then((data) {
      print("获取到的gold=$data");
      GoldModel model = GoldModel.fromMap(data);
      // 数据转换之后调用回调方法
      callBack(model);
    });
  }

  // 获取silver数据
  static getSilverValue(GoldDataCallBack callBack) async {
    NetUtils.get(
            'http://goldayapp.golday999.com/goldayapp/getPriceDataOfDay/LLS')
        .then((data) {
      print("获取到的silver=$data");
      GoldModel model = GoldModel.fromMap(data);
      // 数据转换之后调用回调方法
      callBack(model);
    });
  }
}
