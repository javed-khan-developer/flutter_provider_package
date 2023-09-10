import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favorite_provider.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavouriteProvider>(context);
    print('build');
    return Scaffold(
      body: ListView.builder(
        itemCount: favProvider.items.length,
        itemBuilder: (context, index) {
          return Consumer<FavouriteProvider>(
            builder: (context, value, child) {
              return ListTile(
                onTap: () {
                  if (!value.items.contains(index)) {
                    value.addItems(index);
                  } else {
                    value.removeItems(index);
                  }
                },
                title: const Text('title'),
                trailing: Icon(
                  value.items.contains(index)
                      ? Icons.favorite
                      : Icons.favorite_outline,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
