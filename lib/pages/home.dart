import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aladia/widgets/email_input.dart';
import 'package:aladia/widgets/or_divider.dart';
import 'package:aladia/widgets/social_buttons.dart';
import 'package:aladia/widgets/top_content.dart';
import 'package:aladia/theme_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isSelected;

    return Scaffold(
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
        child: Container(
          height: 640,
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: isDarkMode
                    ? Colors.white.withOpacity(0.2)
                    : Colors.black.withOpacity(0.2)),
            color: isDarkMode ? Colors.black.withOpacity(0.5) : Colors.white,
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Stack(
              children: [
                // Borders for gradients
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.7,
                    child: Column(
                      children: [
                        Container(
                          height: 1,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.transparent, Colors.white],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 1,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.white, Colors.transparent],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        TopContent(isDarkMode: isDarkMode),
                        const SizedBox(height: 32),
                        EmailInput(isDarkMode: isDarkMode),
                        const SizedBox(height: 32),
                        OrDivider(isDarkMode: isDarkMode),
                        const SizedBox(height: 32),
                        SocialButtons(isDarkMode: isDarkMode),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
