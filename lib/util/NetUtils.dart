import 'dart:async';
//import 'package:http/http.dart' as http;
import 'dart:convert' show json;
import 'package:dio/dio.dart';

class NetUtils {
  static Future<dynamic> get(String url, {Map<String, String> params}) async {
    Dio dio = Dio();
//    dio.httpClientAdapter

    try {
      Response response = await dio.get(
        url,
        data:  params,
        options: Options(headers: getCommonHeader())
//        options: RequestOptions(
//          headers: getCommonHeader(),
//        ),
      );
      print("url = $url");
      print("response.request.headers = ${response.request.headers}");

      return (response.data is Map)
          ? response.data
          : json.decode(response.data);
    } on DioError catch (error) {
      print('neUtils.dart-DioError = $error');
    }
  }

  /// post请求
  ///
  static Future<dynamic> post(String url, {Map<String, String> params}) async {
    Dio dio = Dio();
    Response response = await dio.post(
      url,
      data: params,
      options: Options(
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
