import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  final bool isDarkMode;

  const TermsAndConditions({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Add your terms and conditions navigation or functionality here
      },
      child: Center(
        child: Text(
          'Terms & Conditions',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isDarkMode
                ? Colors.white.withOpacity(0.4)
                : Colors.black.withOpacity(0.4), // Dynamic color based on theme
            decoration: TextDecoration
                .underline, // Optional: if you want to underline the text
          ),
        ),
      ),
    );
  }
}
