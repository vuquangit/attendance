import 'dart:async';

import 'package:attendance/helpers/next_screen.dart';
import 'package:attendance/pages/splash_page.dart';
import 'package:attendance/provider/sign_in_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  // init state
  @override
  void initState() {
    final sp = context.read<SignInProvider>();
    super.initState();
    // create a timer of 2 seconds
    Timer(const Duration(seconds: 3), () {
      sp.isSignedIn == false
          ? nextScreenReplaceNamed(context, '/login')
          : nextScreenReplaceNamed(context, '/main');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SplashScreen(),
        ),
      ),
      // body: StreamBuilder<User?>(
      //     stream: FirebaseAuth.instance.authStateChanges(),
      //     builder: (context, snapshot) {
      //       if (!snapshot.hasData) {
      //         return const HomePage();
      //       } else {
      //         return const LoginPage();
      //       }
      //     }),
    );
  }
}
