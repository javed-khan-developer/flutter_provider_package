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
                      trailing: InkWell(
                          onTap: () {
                            if (value.getAllProduct.contains(product)) {
                              value.removeItemFromCart(product);
                              value.calculatePrice();
                            }
                          },
                          child: const Icon(Icons.remove)),
                    );
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 100),
          Consumer<CartProvider>(
            builder: (context, value, child) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Total Price : ${value.totalPrice}'),
                ),
              );
            },
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
