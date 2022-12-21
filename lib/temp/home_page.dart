import 'package:flutter/material.dart';

import 'authentification.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> signOut() async {
    await Authentification().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: signOut,
        child: const Text('Log out'),
      )),
    );
  }
}
