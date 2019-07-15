import 'dart:convert' show json;

class WYNewsDetailModel {
  /// 文章标题
  String title;

  ///新闻发布时间
  String ptime;

  /// 文章body内容
  String body;

  /// 图片数组
  List<imgDetail> img;

  /// 回复数
  int replyCount;

  /// 文章分类
  String category;

  factory WYNewsDetailModel(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? WYNewsDetailModel.fromJson(json.decode(jsonStr))
          : WYNewsDetailModel.fromJson(jsonStr);

  WYNewsDetailModel.fromJson(jsonRes) {
    title = jsonRes['title'];
    ptime = jsonRes['ptime'];
    body = jsonRes['body'];
    replyCount = jsonRes['replyCount'];
    category = jsonRes['category'];

    List imgArr = jsonRes['img'];
    img = imgArr == null
        ? null
        : imgArr.map((oneImg) {
            return imgDetail(oneImg);
          }).toList();
  }
}

class imgDetail {
  String ref;
  String src;
  String alt;
  String pixel;

  double imgWidth;
  double imgHeight;

  factory imgDetail(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? imgDetail.fromJson(json.decode(jsonStr))
          : imgDetail.fromJson(jsonStr);

  imgDetail.fromJson(jsonRes) {
    ref = jsonRes['ref'];
    src = jsonRes['src'];
    alt = jsonRes['alt'];
    pixel = jsonRes['pixel'];

    imgWidth = double.parse(pixel.split('*').first);
    imgHeight = double.parse(pixel.split('*').last);
  }
}

//{
//"ref": "<!--IMG#0-->",
//"src": "http://dingyue.ws.126.net/sy8ykkIqHC7JCeOs7iSFH8QAgEc3Q9DSpJEdOcAhpt1Mm1560841125664compressflag.png",
//"alt": "",
//"pixel": "443*394"
//},
