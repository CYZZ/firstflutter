class GoldNewsList {
  List<gNewsModel> list;
  String ts;
  int page;
  int allPage;
  String allRecord;

  static GoldNewsList fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    GoldNewsList model = GoldNewsList();

    List list = map["list"] ?? [];
    model.list = list.map((element) {
      gNewsModel.fromMap(element);
    }).toList();

    model.ts = map["ts"];
    model.page = map["page"];
    model.allPage = map["allpage"];
    model.allRecord = map["allrecord"];

    return model;
  }
}

class gNewsModel {
  String id;
  String newsTitle;
  String ts;

  static gNewsModel fromMap(Map<String, dynamic> map) {
    if (map == null) {
      return null;
    }
    gNewsModel data = gNewsModel();
    data.id = map["id"];
    data.newsTitle = map["news_title"];
    data.ts = map["ts"];

    return data;
  }
}

//"list": [
//{
//"id": "21069",
//"news_title": "陈峻齐：黄金一周暴跌200美金 下周或进千四时代！",
//"ts": "1584234066"
//},
//{
//"id": "21068",
//"news_title": "黄金周评：物极必反！美元“王者归来”，七年新高后，金价录得1983年以来最大单周跌幅",
//"ts": "1584234065"
//}]
//"page": 1,
//"allpage": 604,
//"allrecord": "9050"
//}
