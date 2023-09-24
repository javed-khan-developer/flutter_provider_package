import 'package:flutter/material.dart';
import 'package:flutter_provider_package/screens/products/product_model.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel productModel;
  const ProductDetails({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Container(
        padding: const EdgeInsets.all(100),
        decoration: BoxDecoration(
            color: Colors.blueGrey, borderRadius: BorderRadius.circular(30)),
        child: ListView(
          children: [
            Text(productModel.id.toString()),
            Text(productModel.name.toString()),
            Text(productModel.price.toString()),
            Text(productModel.discount.toString()),
            Text(productModel.quantity.toString()),
          ],
        ),
      ),
    );
  }
}
