import 'package:flutter/material.dart';
import 'package:flutter_provider_package/screens/jewellary/jewellary_model.dart';

class JewellaryDetails extends StatelessWidget {
  final Jewellary jewellary;
  const JewellaryDetails({super.key, required this.jewellary});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jewellry Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Text(jewellary.title.toString()),
            const SizedBox(height: 50),
            Image.network(
              jewellary.image.toString(),
              height: MediaQuery.sizeOf(context).height / 2,
              width: MediaQuery.sizeOf(context).width,
            ),
            const SizedBox(height: 50),
            Text(
              jewellary.description.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
