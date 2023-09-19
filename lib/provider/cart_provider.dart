import 'package:flutter/material.dart';
import 'package:flutter_provider_package/screens/products/product_model.dart';

class CartProvider with ChangeNotifier {
  final List<ProductModel> _productModel = [];
  int _totalPrice = 0;
  List<ProductModel> get getAllProduct => _productModel;
  int get totalPrice => _totalPrice;

  void addItemToCart(ProductModel productModel) {
    _productModel.add(productModel);
    notifyListeners();
  }

  void removeItemFromCart(ProductModel productModel) {
    _productModel.removeWhere(
      (element) => element.id == productModel.id,
    );
    notifyListeners();
  }

  calculatePrice() {
    _totalPrice = 0;
    for (var element in _productModel) {
      _totalPrice += element.price!;
      print(_totalPrice);
    }
    notifyListeners();
  }
}
