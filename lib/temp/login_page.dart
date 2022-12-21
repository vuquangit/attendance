import 'package:flutter/material.dart';

import 'authentification.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  Future<void> signInWithGoogle() async {
    await Authentification().signInWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: signInWithGoogle,
          child: const Text('Login With Google'),
        ),
      ),
    );
  }
}
