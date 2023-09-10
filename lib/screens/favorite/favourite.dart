import 'package:flutter/material.dart';
import 'package:flutter_provider_package/provider/favorite_provider.dart';
import 'package:flutter_provider_package/screens/favorite/my_favourite.dart';
import 'package:provider/provider.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyFavorite(),
                    ));
              },
              icon: Icon(Icons.favorite))
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
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
