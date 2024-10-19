// splash_screen_handler.dart

import 'package:flutter/material.dart';
import 'package:aladia/pages/home.dart';
import 'package:aladia/splash_screen.dart';

class SplashScreenHandler extends StatefulWidget {
  const SplashScreenHandler({Key? key}) : super(key: key);

  @override
  _SplashScreenHandlerState createState() => _SplashScreenHandlerState();
}

class _SplashScreenHandlerState extends State<SplashScreenHandler> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3)); // Wait for 3 seconds
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Home()),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Pass theme mode if necessary
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return SplashScreen(isDarkMode: isDarkMode);
  }
}
