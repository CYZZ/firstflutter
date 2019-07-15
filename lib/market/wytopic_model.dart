import 'dart:convert' show json;

import 'package:firstflutter/market/wynews_model.dart';

class WYTopicModel {
  int code;
  String message;
  Map<String, List<TTopic>> data;
  List<TTopic> tList;

  factory WYTopicModel(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? WYNewsModel.fromJson(json.decode(jsonStr))
          : WYTopicModel.fromJson(jsonStr);

  WYTopicModel.fromJson(jsonRes) {
    code = jsonRes["code"];
    message = jsonRes["message"];

    List maptList = jsonRes["data"]["tList"];
    List<TTopic> topicList = [];
//    print('mapList = $maptList');
    for (var topic in maptList) {
      topicList.add(TTopic.fromJson(topic));
    }
    data = {"tList": topicList};
    tList = topicList;
  }
}

class TTopic {
  String template;
  String img;
  int recommendOrder;
  String color;
  int ad_type;
  bool hasCover;
  String tname;
  int hashead;
  String recommend;
  int isNew;
  String tid;
  bool headLine;
  int special;
  String ename;
  String topicid;
  bool hasIcon;
  int bannerOrder;
  int repeatSeconds;
  String alias;
  String showType;
  String subnum;
  int hasAD;
  int isHot;
  String cid;

  TTopic.fromJson(jsonRes) {
    template = jsonRes["template"];
    img = jsonRes["img"];
    recommendOrder = jsonRes["recommendOrder"];
    color = jsonRes["color"];
    ad_type = jsonRes["ad_type"];
    hasCover = jsonRes["hasCover"];
    tname = jsonRes["tname"];
    hashead = jsonRes["hashead"];
    recommend = jsonRes["recommend"];
    isNew = jsonRes["isNew"];
    tid = jsonRes["tid"];
    headLine = jsonRes["headLine"];
    special = jsonRes["special"];
    ename = jsonRes["ename"];
    topicid = jsonRes["topicid"];
    hasIcon = jsonRes["hasIcon"];
    bannerOrder = jsonRes["bannerOrder"];
    repeatSeconds = jsonRes["repeatSeconds"];
    alias = jsonRes["alias"];
    showType = jsonRes["showType"];
    subnum = jsonRes["subnum"];
    hasAD = jsonRes["hasAD"];
    isHot = jsonRes["isHot"];
    cid = jsonRes["cid"];
  }
}

//{
//code: 0,
//message: "成功",
//data: {
//tList: [
//{
//template: "normal1",
//img: "http://img2.cache.netease.com/m/newsapp/banner/zhenhua.png",
//recommendOrder: 0,
//color: "",
//ad_type: 1,
//hasCover: false,
//tname: "独家",
//hashead: 1,
//recommend: "0",
//isNew: 0,
//tid: "T1370583240249",
//headLine: false,
//special: 0,
//ename: "zhenhua",
//topicid: "000181S1",
//hasIcon: true,
//bannerOrder: 105,
//repeatSeconds: 0,
//alias: "The Truth",
//showType: "comment",
//subnum: "0",
//hasAD: 1,
//isHot: 0,
//cid: "C1348654575297"
//},
//{
//template: "recommend",
//img: "T1348649145984",
//recommendOrder: 108,
//color: "",
//ad_type: 1,
//hasCover: false,
//tname: "NBA",
//hashead: 1,
//recommend: "1",
//isNew: 0,
//tid: "T1348649145984",
//headLine: false,
//special: 0,
//ename: "NBA",
//topicid: "0005876B",
//hasIcon: true,
//bannerOrder: 70,
//repeatSeconds: 0,
//alias: "NBA",
//showType: "comment",
//subnum: "0",
//hasAD: 1,
//isHot: 0,
//cid: "C1348649048655"
//}]
//};
