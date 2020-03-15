import 'package:firstflutter/idea/model/gold_model.dart';
import 'package:firstflutter/notice/model/gold_api.dart';
import 'package:firstflutter/notice/model/gold_news_list.dart';
import 'package:firstflutter/notice/model/gold_td_list.dart';
import 'package:firstflutter/util/NetUtils.dart';

typedef GoldDataCallBack = void Function(GoldTdList model);

class GoldTdNetwork {
  // 获取gold数据
  static getGoldTdListModel(GoldDataCallBack callBack) async {
    NetUtils.get(GoldApi.goldDataList).then((data) {
      print("获取到的goldtd=$data");
      GoldTdList tdModel = GoldTdList.fromMap(data);

      // 数据转换之后调用回调方法
      callBack(tdModel);
    });
  }

  // 获取资讯列表数据
  static getGoldNewsList(void callBack(GoldNewsList m)) async {
    NetUtils.get(GoldApi.gNewsList).then((data) {
      print("获取到的silver=$data");
      GoldNewsList model = GoldNewsList.fromMap(data);
      // 数据转换之后调用回调方法
      callBack(model);
    });
  }
}
