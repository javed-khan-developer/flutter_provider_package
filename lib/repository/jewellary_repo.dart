import 'package:flutter_provider_package/network/network_client.dart';
import 'package:flutter_provider_package/screens/jewellary/jewellary_model.dart';

class JewellaryRepo extends NetworkClient {
  Future<List<Jewellary>> getMyJewllary() async {
    var response = await getRequest(
        path: 'https://fakestoreapi.com/products/category/jewelery');
    final jewellaryResponse = jewellaryFromJson(response.data.toString());
    return jewellaryResponse;
  }
}
