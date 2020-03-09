import 'package:flutter/material.dart';

class GoldModel {
  int code;
  String msg;
  GoldData data;

  static GoldModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    GoldModel model = GoldModel();
    model.code = map['code'];
    model.msg = map['msg'];
    model.data = GoldData.fromMap(map['data']);
    return model;
  }
}

class GoldData {
  double mostHigh;
  double mostLow;
  double close;
  double open;

  static GoldData fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    GoldData data = GoldData();
    data.mostHigh = map['mostHigh'];
    data.mostLow = map['mostLow'];
    data.open = map['open'];
    data.close = map['close'];
    return data;
  }
}

//{
//"code": 10000,
//"msg": "请求成功",
//"data": {
//"mostHigh": 17.25,
//"mostLow": 17.1,
//"close": 17.2,
//"open": 17.2
//}
//}
