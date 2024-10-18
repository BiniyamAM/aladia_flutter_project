import 'package:flutter/material.dart';

class TopContent extends StatelessWidget {
  final bool isDarkMode;

  const TopContent({Key? key, required this.isDarkMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: isDarkMode
            ? Colors.black.withOpacity(0.8)
            : Colors.white.withOpacity(0.8),
        border: Border.all(
            color: isDarkMode
                ? Colors.white.withOpacity(0.2)
                : Colors.black.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/app_icon.png',
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to Aladia,',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Create or access your account from here',
                  style: TextStyle(
                    color: Colors.white70,
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
