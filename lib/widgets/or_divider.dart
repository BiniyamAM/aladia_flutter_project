import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  final bool isDarkMode;

  const OrDivider({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Divider(
                color: isDarkMode
                    ? Colors.white.withOpacity(0.1)
                    : Colors.black.withOpacity(0.1))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text('Or',
              style:
                  TextStyle(color: isDarkMode ? Colors.white : Colors.black)),
        ),
        Expanded(
            child: Divider(
                color: isDarkMode
                    ? Colors.white.withOpacity(0.1)
                    : Colors.black.withOpacity(0.1))),
      ],
    );
  }
}
