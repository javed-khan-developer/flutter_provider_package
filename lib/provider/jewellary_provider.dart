import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_package/repository/jewellary_repo.dart';
import 'package:http/http.dart' as http;
import '../screens/jewellary/jewellary_model.dart';

class JewellaryProvider with ChangeNotifier {
  final List<Jewellary> jewellaryList = [];
  Dio dio = Dio();
  void getJewellary() async {
    try {
      // var result = await JewellaryRepo().getMyJewllary();
      // debugPrint(result.toString());
      // jewellaryList.addAll(result);
      var response = await http.get(
          Uri.parse('https://fakestoreapi.com/products/category/jewelery'));
      final jewellaryResponse = jewellaryFromJson(response.body);
      jewellaryList.addAll(jewellaryResponse);
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
