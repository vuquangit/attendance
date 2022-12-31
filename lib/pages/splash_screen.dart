import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextLiquidFill(
      text: 'ATTENDANCE',
      waveColor: Colors.blueAccent,
      boxBackgroundColor: Colors.white,
      textStyle: const TextStyle(
        fontSize: 40.0,
        fontWeight: FontWeight.bold,
      ),
      // boxHeight: 300.0,
      loadDuration: const Duration(seconds: 2),
      waveDuration: const Duration(seconds: 2),
    );
  }
}
