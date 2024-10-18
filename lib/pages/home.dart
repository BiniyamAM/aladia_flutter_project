import 'dart:ui';
import 'package:aladia/widgets/term_&_condition.dart';
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
      backgroundColor:
          isDarkMode ? Colors.black : Colors.white, // Background color
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        width: 350,
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isDarkMode
                                ? Colors.white.withOpacity(0.2)
                                : Colors.black.withOpacity(0.2),
                          ),
                          color: isDarkMode
                              ? Colors.black.withOpacity(0.5)
                              : Colors.white,
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 16),
                                TopContent(isDarkMode: isDarkMode),
                                const SizedBox(height: 32),
                                EmailInput(isDarkMode: isDarkMode),
                                const SizedBox(height: 32),
                                OrDivider(isDarkMode: isDarkMode),
                                const SizedBox(height: 32),
                                SocialButtons(isDarkMode: isDarkMode),
                                const SizedBox(height: 12),
                                TermsAndConditions(isDarkMode: isDarkMode),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
