import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class NetworkClient {
  Dio dio = Dio();
  Future<Response> getRequest({required String path}) async {
    try {
      var response = await dio.get(path);
      debugPrint("==========API Response==========");
      debugPrint("Status code : ${response.statusCode}");
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint(e.response!.data);
        debugPrint(e.response!.headers.toString());
        debugPrint(e.response!.requestOptions.toString());
        throw Exception(e.response!.statusMessage.toString());
      } else {
        debugPrint(e.requestOptions.toString());
        debugPrint(e.message);
      }
      throw Exception(e.response!.statusMessage.toString());
    }
  }
}
