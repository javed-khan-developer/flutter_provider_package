import 'package:flutter/material.dart';
import 'package:flutter_provider_package/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class MyDarkTheme extends StatelessWidget {
  const MyDarkTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Theme')),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            title: const Text('Ligth Mode'),
            value: ThemeMode.light,
            groupValue: provider.themeMode,
            onChanged: provider.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: const Text('Dark Mode'),
            value: ThemeMode.dark,
            groupValue: provider.themeMode,
            onChanged: provider.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: const Text('System'),
            value: ThemeMode.system,
            groupValue: provider.themeMode,
            onChanged: provider.setTheme,
          ),
        ],
      ),
    );
  }
}
