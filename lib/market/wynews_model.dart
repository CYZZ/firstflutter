import 'dart:convert' show json;

class WYNewsModel {
  /// 新闻发布时间
  String ptime;

  /// 新闻标题
  String title;

  /// 图片数组
//  List<String> imagextra;
  String imgsrc;

  /// 来源
  String source;

  /// 文章ID
  String docid;

  /// 列表预览图片数组，可能为空
  List imgextra;

  WYNewsModel.fromJson(jsonRes) {
    ptime = jsonRes["ptime"];
    title = jsonRes["title"];
    imgsrc = jsonRes["imgsrc"];
    source = jsonRes["source"];
    docid = jsonRes["docid"];
    imgextra = jsonRes["imgextra"];
  }
}

//template: "recommend",
//ispullstay: "0",
//lmodify: "2019-06-19 07:15:41",
//source: "网易体育",
//postid: "EI11OJ960005877U",
//title: "曝灯泡组合已不可修复 哈登:他走,或我走",
//mtime: "2019-06-19 07:15:41",
//hasImg: 1,
//professional: "0",
//topic_background: "http://img2.cache.netease.com/m/newsapp/reading/cover1/C1348649048655.jpg",
//digest: "网易体育6月19日报道：据《雅虎体育》记者文森特-古德温报道，联盟消息人士透露，休斯敦火箭队的两大明星球员哈登与保罗之间的关系已经不可修复。在火箭队季后赛输给金",
//boardid: "sports2_bbs",
//alias: "NBA",
//hasAD: 1,
//imgsrc: "http://cms-bucket.ws.126.net/2019/06/19/3cd6c1ca76f047b38b1df7f6524cee86.jpeg",
//ptime: "2019-06-19 07:04:59",
//daynum: "18066",
//hasHead: 1,
//order: 1,
//votecount: 8209,
//hasCover: false,
//docid: "EI11OJ960005877U",
//tname: "NBA",
//url_3w: "http://sports.163.com/19/0619/07/EI11OJ960005877U.html",
//dkeys: "哈登,灯泡",
//priority: 255,
//ipadcomment: "",
//url: "http://3g.163.com/sports/19/0619/07/EI11OJ960005877U.html",
//userClassify: "体育,NBA",
//ename: "NBA",
//replyCount: 8852,
//"imgextra": [{
//"imgsrc": "http://bjnewsrec-cv.ws.126.net/three52198096ed08a17aef15c89e086a2daae74.jpg"
//}, {
//"imgsrc": "http://bjnewsrec-cv.ws.126.net/three9264f6784559e78e06e5e3c33ca52507cf7.jpg"
//}],
//ltitle: "曝灯泡组合已不可修复 哈登:他走,或我走",
//hasIcon: true,
//subtitle: "",
//category: "体育,NBA",
//interests: "体育_哈登",
//region: "",
//prompt: "成功为您推荐12条新内容",
//cid: "C1348649048655"
