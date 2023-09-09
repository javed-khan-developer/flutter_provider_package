import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/count_provider.dart';

class Count extends StatefulWidget {
  const Count({super.key});

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final provider = Provider.of<CounterProvider>(context, listen: false);
    Timer.periodic(const Duration(seconds: 2), (timer) {
      provider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CounterProvider>(
              builder: (context, value, child) {
                print('only this widget build');
                return Text(
                  value.count.toString(),
                  style: const TextStyle(
                    fontSize: 100,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
