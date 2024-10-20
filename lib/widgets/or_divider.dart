import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  final bool isDarkMode;

  const OrDivider({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Gradient before "Or"
        Expanded(
          child: Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  isDarkMode
                      ? Colors.white.withOpacity(0)
                      : Colors.black.withOpacity(0),
                  isDarkMode ? Colors.white : Colors.black,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Or',
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
        // Gradient after "Or"
        Expanded(
          child: Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  isDarkMode ? Colors.white : Colors.black,
                  isDarkMode
                      ? Colors.white.withOpacity(0)
                      : Colors.black.withOpacity(0),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
