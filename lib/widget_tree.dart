import 'dart:async';

import 'package:attendance/helpers/next_screen.dart';
import 'package:attendance/provider/sign_in_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'auth.dart';
import 'pages/home_page.dart';
// import 'pages/login_register_page.dart';
import 'pages/login_page.dart';

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
    Timer(const Duration(seconds: 1), () {
      sp.isSignedIn == false
          ? nextScreen(context, const LoginPage())
          : nextScreen(context, const HomePage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Loading...'),
          // child: Image(
          //   image: AssetImage('assets/images/cupertino_activity_indicator.gif'),
          //   height: 80,
          //   width: 80,
          // ),
        ),
      ),
    );
  }
}
