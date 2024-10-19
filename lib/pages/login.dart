// ignore_for_file: deprecated_member_use

import 'package:aladia/provider/authProvider.dart';
import 'package:aladia/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/login_content.dart'; // Import the LoginContent widget

class MyLogin extends StatelessWidget {
  const MyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    // You can set isDarkMode based on system settings or user preference
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return MaterialApp(
      title: 'Aladia App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: isDarkMode ? Colors.black : Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Consumer<ThemeProvider>(
                builder: (context, themeProvider, child) {
                  return Switch(
                    activeColor: isDarkMode
                        ? Colors.white.withOpacity(0.1)
                        : Colors.black.withOpacity(0.1),
                    inactiveThumbColor: Colors.white.withOpacity(0.1),
                    thumbColor: MaterialStatePropertyAll(
                      isDarkMode
                          ? Colors.black.withOpacity(0.5)
                          : Colors.white.withOpacity(0.5),
                    ),
                    inactiveTrackColor: isDarkMode
                        ? Colors.black.withOpacity(0.5)
                        : Colors.black.withOpacity(0.3),
                    thumbIcon: MaterialStatePropertyAll(
                      themeProvider.isSelected
                          ? const Icon(Icons.nights_stay)
                          : const Icon(Icons.wb_sunny, color: Colors.white),
                    ),
                    value: themeProvider.isSelected,
                    onChanged: (value) {
                      themeProvider.toggleTheme();
                    },
                  );
                },
              ),
            ),
          ],
        ),
        body: Center(
          child: ChangeNotifierProvider(
              create: (context) => AuthProvider(),
              child: LoginContent(isDarkMode: isDarkMode)),
        ),
      ),
    );
  }
}
