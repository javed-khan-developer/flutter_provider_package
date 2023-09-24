import 'package:flutter/material.dart';
import 'package:flutter_provider_package/provider/cart_provider.dart';
import 'package:flutter_provider_package/screens/cart/cart.dart';
import 'package:flutter_provider_package/screens/products/product_details.dart';
import 'package:flutter_provider_package/screens/products/product_model.dart';
import 'package:provider/provider.dart';

class Products extends StatelessWidget {
  const Products({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Cart(),
                    ),
                  ),
              child: const Icon(Icons.shopping_cart))
        ],
      ),
      body: ListView.builder(
        itemCount: ProductModel.products.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetails(
                        productModel: ProductModel.products[index]),
                  ));
            },
            child: ListTile(
              title: Text('name : ${ProductModel.products[index].name!}'),
              subtitle: Text(
                'price : ${ProductModel.products[index].price}'.toString(),
                style: const TextStyle(decoration: TextDecoration.lineThrough),
              ),
              leading: Column(
                children: [
                  Text(
                      'price : ${ProductModel.products[index].price! - ProductModel.products[index].discount!}'),
                  Text('discount : ${ProductModel.products[index].discount!}'),
                ],
              ),
              trailing: Consumer<CartProvider>(
                builder: (context, value, child) {
                  return InkWell(
                      onTap: () {
                        if (value.getAllProduct
                            .contains(ProductModel.products[index])) {
                          value
                              .removeItemFromCart(ProductModel.products[index]);
                          value.calculatePrice();
                        } else {
                          value.addItemToCart(ProductModel.products[index]);
                          value.calculatePrice();
                        }
                      },
                      child: Icon(
                        value.getAllProduct
                                .contains(ProductModel.products[index])
                            ? Icons.remove
                            : Icons.add,
                      ));
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
