import 'package:flutter/material.dart';
import 'package:flutter_provider_package/screens/products/product_model.dart';

class CartProvider with ChangeNotifier {
  final List<ProductModel> _productModel = [];
  int _totalPrice = 0;
  int _totalDiscount = 0;
  List<ProductModel> get getAllProduct => _productModel;
  int get totalPrice => _totalPrice;
  int get totalDiscount => _totalDiscount;
  void addItemToCart(ProductModel productModel) {
    _productModel.add(productModel);
    calculatePrice();
    calculateDiscount();
    notifyListeners();
  }

  void removeItemFromCart(ProductModel productModel) {
    _productModel.removeWhere(
      (element) => element.id == productModel.id,
    );
    notifyListeners();
  }

  setIncreaseQuantity(ProductModel productModel) {
    final product =
        _productModel.firstWhere((element) => element.id == productModel.id);
    product.quantity++;
    debugPrint(product.quantity.toString());
    notifyListeners();
  }

  setdecreaseQuantity(ProductModel productModel) {
    final product =
        _productModel.firstWhere((element) => element.id == productModel.id);
    if (product.quantity > 1) {
      product.quantity--;
    }
    notifyListeners();
  }

  calculateDiscount() {
    _totalDiscount = 0;
    for (var element in _productModel) {
      _totalDiscount += element.discount! * element.quantity;
    }
    notifyListeners();
  }

  calculatePrice() {
    _totalPrice = 0;
    for (var element in _productModel) {
      _totalPrice += element.price! * element.quantity;
      print(_totalPrice);
    }
    notifyListeners();
  }
}
