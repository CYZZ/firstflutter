class GoldApi {
  /// 黄金数据列表
  static final String goldDataList =
      "http://47.92.51.12/gold_api/gold_data_list.php";

  /// 咨询列表
  static final String gNewsList =
      "http://47.92.51.12/gold_api/gnews_list.php?class_id=(null)&page=1";

  /// 获取资讯详情（需要拼接对应的资讯ID）
  static final String gNewsView =
      "http://47.92.51.12/gold_api/gnews_view.php?id=";
}
