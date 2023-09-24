import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_package/provider/jewellary_provider.dart';
import 'package:flutter_provider_package/screens/jewellary/jewellary_details_screen.dart';
import 'package:provider/provider.dart';

class JewellaryScreen extends StatelessWidget {
  const JewellaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<JewellaryProvider>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.jewellaryList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JewellaryDetails(
                            jewellary: value.jewellaryList[index]),
                      ));
                },
                child: ListTile(
                  leading: CachedNetworkImage(
                    height: 100,
                    width: 100,
                    imageUrl: value.jewellaryList[index].image
                        .toString(), // URL of the image
                    placeholder: (context, url) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.grey,
                      ),
                    ), // Placeholder widget
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error), // Error widget
                  ),
                  title: Text(value.jewellaryList[index].price.toString()),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
