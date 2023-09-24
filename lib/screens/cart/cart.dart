import 'package:flutter/material.dart';
import 'package:flutter_provider_package/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Consumer<CartProvider>(
            builder: (context, value, child) {
              return Expanded(
                child: ListView.builder(
                  itemCount: value.getAllProduct.length,
                  itemBuilder: (context, index) {
                    final product = value.getAllProduct[index];
                    return ListTile(
                      title: Text(value.getAllProduct[index].name!),
                      subtitle:
                          Text(value.getAllProduct[index].price.toString()),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              value.setdecreaseQuantity(product);
                              value.calculatePrice();
                              value.calculateDiscount();
                            },
                            icon: const Icon(Icons.remove),
                          ),
                          Text(
                            product.quantity.toString(),
                            style: const TextStyle(fontSize: 18),
                          ),
                          IconButton(
                            onPressed: () {
                              value.setIncreaseQuantity(product);
                              value.calculatePrice();
                              value.calculateDiscount();
                            },
                            icon: const Icon(Icons.add),
                          ),
                          IconButton(
                              onPressed: () {
                                if (value.getAllProduct.contains(product)) {
                                  value.removeItemFromCart(product);
                                  value.calculatePrice();
                                  value.calculateDiscount();
                                }
                              },
                              icon: const Icon(Icons.delete)),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 100),
          Consumer<CartProvider>(
            builder: (context, value, child) {
              return Column(children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: value.totalPrice > 0
                        ? Text('Total Price : ${value.totalPrice}')
                        : const Text('')),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: value.totalDiscount > 0
                        ? Text('Total Discount : ${value.totalDiscount}')
                        : const Text('')),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: value.totalDiscount > 0
                        ? Text(
                            'Pay Only : ${value.totalPrice - value.totalDiscount}')
                        : const Text('')),
              ]);
            },
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
