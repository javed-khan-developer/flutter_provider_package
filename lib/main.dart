import 'package:flutter/material.dart';
import 'package:flutter_provider_package/provider/auth_provider.dart';
import 'package:flutter_provider_package/provider/cart_provider.dart';
import 'package:flutter_provider_package/provider/jewellary_provider.dart';
import 'package:flutter_provider_package/screens/cart/cart.dart';
import 'package:flutter_provider_package/screens/jewellary/jewellary_model.dart';
import 'package:flutter_provider_package/screens/jewellary/jewellary_screen.dart';
import 'package:flutter_provider_package/screens/login/login.dart';
import 'package:flutter_provider_package/screens/products/products.dart';
import 'package:provider/provider.dart';

import 'provider/count_provider.dart';
import 'provider/example_one_provider.dart';
import 'provider/favorite_provider.dart';
import 'provider/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(
            create: (_) => JewellaryProvider()..getJewellary()),
      ],
      child: Builder(builder: (context) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          themeMode: themeProvider.themeMode,
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(brightness: Brightness.dark),
          home: const Products(),
        );
      }),
    );
  }
}
