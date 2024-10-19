import 'package:flutter/material.dart';

class TopContent extends StatelessWidget {
  final bool isDarkMode;

  const TopContent({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        gradient: isDarkMode
            ? LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.grey.withOpacity(0.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.8),
                  Colors.grey.withOpacity(0.5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
        border: Border.all(
          color: isDarkMode
              ? Colors.white.withOpacity(0.2)
              : Colors.black.withOpacity(0.2),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/image.png',
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to Aladia,',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: isDarkMode
                        ? Colors.white
                        : Colors.black, // Adjusted text color
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Create or access your account from here',
                  style: TextStyle(
                    color: isDarkMode
                        ? Colors.white70
                        : Colors.black54, // Adjusted text color
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
