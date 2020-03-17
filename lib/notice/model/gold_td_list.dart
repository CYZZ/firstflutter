class GoldTdList {
  List<GoldTdData> list1;
  List<GoldTdData> list2;
  List<GoldTdData> list3;
  String ts;

  static GoldTdList fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    GoldTdList model = GoldTdList();

    List list1 = map["list1"] ?? [];
    model.list1 = list1.map((element) {
      return GoldTdData.fromMap(element);
    }).toList();

    List list2 = map["list2"] ?? [];
    model.list2 = list2.map((element) {
      return GoldTdData.fromMap(element);
    }).toList();

    List list3 = map["list3"] ?? [];
    model.list3 = list3.map((element) {
      return GoldTdData.fromMap(element);
    }).toList();
    return model;
  }
}

class GoldTdData {
  String id;
  String typeName;
  String flag;
  String bankInPrice;
  String bankOutPrice;
  String middlePrice;
  String minPrice;
  String maxPrice;

  String tPrice;
  String tPercent;
  String tCjl;
  String tOpenPrice;
  String tClosePrice;

  static GoldTdData fromMap(Map<String, dynamic> map) {
    if (map == null) {
      /// 使用默认数据进行递归调用
      return GoldTdData.fromMap(defaultData);
    }
    GoldTdData data = GoldTdData();
    data.id = map["id"];
    data.typeName = map["type_name"];
    data.flag = map["flag"];
    data.bankInPrice = map["bank_in_price"] ?? "0";
    data.bankOutPrice = map["bank_out_price"] ?? "0";
    data.middlePrice = map["middle_price"] ?? "0";
    data.minPrice = map["min_price"] ?? "0";
    data.maxPrice = map["max_price"] ?? "0";

    data.tPrice = map["t_price"];
    data.tPercent = map["t_percent"];
    data.tCjl = map["t_cjl"];
    data.tOpenPrice = map["t_open_price"];
    data.tClosePrice = map["t_close_pirce"];

    return data;
  }

  /// 默认的初始数据
  static Map defaultData = {
    "id": "999",
    "type_name": "产品名称",
    "flag": "0",
    "bank_in_price": "0",
    "bank_out_price": "0",
    "middle_price": "0",
    "min_price": "0",
    "max_price": "0"
  };
}

// 20200315182848
// http://47.92.51.12/gold_api/gold_data_list.php

//{
//"list1": [
//{
//"id": "1",
//"type_name": "人民币账户黄金",
//"flag": "1",
//"bank_in_price": "342.74",
//"bank_out_price": "343.24",
//"middle_price": "342.99",
//"min_price": "339.22",
//"max_price": "346.67"
//},
//{
//"id": "2",
//"type_name": "人民币账户白银",
//"flag": "1",
//"bank_in_price": "3.289",
//"bank_out_price": "3.309",
//"middle_price": "3.299",
//"min_price": "3.258",
//"max_price": "3.339"
//},
//{
//"id": "3",
//"type_name": "人民币账户铂金",
//"flag": "0",
//"bank_in_price": "170.73",
//"bank_out_price": "173.13",
//"middle_price": "171.93",
//"min_price": "166.75",
//"max_price": "172.94"
//},
//{
//"id": "4",
//"type_name": "人民币账户钯金",
//"flag": "0",
//"bank_in_price": "396.26",
//"bank_out_price": "405.21",
//"middle_price": "399.61",
//"min_price": "368.22",
//"max_price": "400.92"
//},
//{
//"id": "16",
//"type_name": "美元账户黄金",
//"flag": "1",
//"bank_in_price": "1521.2550",
//"bank_out_price": "1523.0550",
//"middle_price": "1522.1550",
//"min_price": "1505.4300",
//"max_price": "1538.4950"
//},
//{
//"id": "17",
//"type_name": "美元账户白银",
//"flag": "1",
//"bank_in_price": "14.5910",
//"bank_out_price": "14.6910",
//"middle_price": "14.6410",
//"min_price": "14.4565",
//"max_price": "14.8175"
//},
//{
//"id": "18",
//"type_name": "美元账户铂金",
//"flag": "0",
//"bank_in_price": "757.0000",
//"bank_out_price": "769.0000",
//"middle_price": "763.0000",
//"min_price": "739.5000",
//"max_price": "767.5000"
//},
//{
//"id": "19",
//"type_name": "美元账户钯金",
//"flag": "0",
//"bank_in_price": "1758.4000",
//"bank_out_price": "1798.4000",
//"middle_price": "1773.4000",
//"min_price": "1634.1100",
//"max_price": "1779.2500"
//}
//],
//"list2": [
//{
//"id": "5",
//"type_name": "Ag(T+D)",
//"flag": "1",
//"t_price": "3533.00",
//"t_percent": "-8.02%",
//"t_cjl": "20862096",
//"t_open_price": "3772.00",
//"t_close_pirce": "3757.00",
//"min_price": "3533.00",
//"max_price": "3811.00"
//},
//{
//"id": "6",
//"type_name": "Au(T+D)",
//"flag": "1",
//"t_price": "344.20",
//"t_percent": "-3.30%",
//"t_cjl": "188170",
//"t_open_price": "354.89",
//"t_close_pirce": "355.47",
//"min_price": "340.03",
//"max_price": "358.15"
//},
//{
//"id": "7",
//"type_name": "Au(T+N1)",
//"flag": "1",
//"t_price": "346.25",
//"t_percent": "-2.49%",
//"t_cjl": "936",
//"t_open_price": "355.10",
//"t_close_pirce": "356.20",
//"min_price": "337.35",
//"max_price": "358.60"
//},
//{
//"id": "8",
//"type_name": "Au(T+N2)",
//"flag": "1",
//"t_price": "351.90",
//"t_percent": "-2.49%",
//"t_cjl": "172",
//"t_open_price": "358.50",
//"t_close_pirce": "360.35",
//"min_price": "344.45",
//"max_price": "359.00"
//},
//{
//"id": "9",
//"type_name": "mAu(T+D)",
//"flag": "1",
//"t_price": "344.25",
//"t_percent": "-3.44%",
//"t_cjl": "349982",
//"t_open_price": "354.98",
//"t_close_pirce": "355.44",
//"min_price": "340.40",
//"max_price": "358.28"
//}
//],
//"list3": [
//{
//"id": "10",
//"type_name": "Au100g",
//"flag": "1",
//"t_price": "349.30",
//"t_percent": "-2.21%",
//"t_cjl": "336",
//"t_open_price": "358.00",
//"t_close_pirce": "357.20",
//"min_price": "343.00",
//"max_price": "358.98"
//},
//{
//"id": "11",
//"type_name": "Au99.95",
//"flag": "2",
//"t_price": "0.00",
//"t_percent": "0.00%",
//"t_cjl": "0",
//"t_open_price": "0.00",
//"t_close_pirce": "354.75",
//"min_price": "0.00",
//"max_price": "0.00"
//},
//{
//"id": "12",
//"type_name": "Au99.99",
//"flag": "1",
//"t_price": "344.21",
//"t_percent": "-3.32%",
//"t_cjl": "38176",
//"t_open_price": "358.88",
//"t_close_pirce": "356.02",
//"min_price": "341.00",
//"max_price": "358.88"
//},
//{
//"id": "13",
//"type_name": "iAu100g",
//"flag": "2",
//"t_price": "0.00",
//"t_percent": "0.00%",
//"t_cjl": "0",
//"t_open_price": "0.00",
//"t_close_pirce": "266.67",
//"min_price": "0.00",
//"max_price": "0.00"
//},
//{
//"id": "14",
//"type_name": "iAu99.5",
//"flag": "2",
//"t_price": "0.00",
//"t_percent": "0.00%",
//"t_cjl": "0",
//"t_open_price": "0.00",
//"t_close_pirce": "237.80",
//"min_price": "0.00",
//"max_price": "0.00"
//},
//{
//"id": "15",
//"type_name": "iAu99.99",
//"flag": "1",
//"t_price": "356.00",
//"t_percent": "-0.11%",
//"t_cjl": "250",
//"t_open_price": "357.30",
//"t_close_pirce": "356.38",
//"min_price": "356.00",
//"max_price": "357.30"
//}
//],
//"ts": "1584268128"
//}
