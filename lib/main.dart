import 'package:flutter/material.dart';
import 'package:aladia/pages/home.dart';
import 'package:aladia/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        // Add other providers here if necessary
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
      home: const Home(),
      theme: Provider.of<ThemeProvider>(context)
          .themeData, // Apply the selected theme
    );
  }
}
