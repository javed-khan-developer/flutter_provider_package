import 'package:flutter/material.dart';
import 'package:flutter_provider_package/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(hintText: 'email'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(hintText: 'password'),
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                authProvider.login(
                  emailController.text,
                  passwordController.text,
                );
              },
              child: authProvider.loading
                  ? const CircularProgressIndicator()
                  : const Text('login'),
            )
          ],
        ),
      ),
    );
  }
}
