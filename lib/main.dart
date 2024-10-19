import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aladia/provider/authProvider.dart';
import 'package:aladia/provider/theme_provider.dart';
import 'package:aladia/splash_screen_handler.dart'; // Import the SplashScreenHandler

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const SplashScreenHandler(),
    );
  }
}
