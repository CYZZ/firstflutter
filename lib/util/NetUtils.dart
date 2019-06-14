import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';

class NetUtils {
  static Future<dynamic> get(String url, {Map<String, String> params}) async {
//    if (params != null && params.isNotEmpty) {
//      // 如果参数不为空直接把参数拼接在url后面
//      StringBuffer sb = StringBuffer("?");
//      params.forEach((key, value) {
//        sb.write("$key" + "=" + "$value" + "&");
//        String paramStr = sb.toString();
//        paramStr = paramStr.substring(0, paramStr.length - 1); // 裁剪最后一个&
//        url += paramStr;
//      });
//    }

    Dio dio = Dio();
//    dio.httpClientAdapter


    Response response = await dio.get(
      url,
      queryParameters: params,
      options: RequestOptions(
        headers: getCommonHeader(),
      ),
    );
print("url = $url");
    print("response.request.headers = ${response.request.headers}");
    return response.data;
//    http.Response response = await http.get(url,headers: getCommonHeader());
//    return response.body;
  }

  /// post请求
  ///
  static Future<dynamic> post(String url, {Map<String, String> params}) async {
    Dio dio = Dio();
    Response response = await dio.post(
      url,
      queryParameters: params,
      options: RequestOptions(
        headers: getCommonHeader(),
      ),
    );

    return response.data;
//    http.Response response = await http.post(url,body: params,headers: getCommonHeader());
//    return response.body;
  }

  static Map<String, String> getCommonHeader() {
    Map<String, String> header = Map();
    header['is_flutter_osc'] = "1";
    return header;
  }
}
