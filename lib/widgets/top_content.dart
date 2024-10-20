import 'package:flutter/material.dart';
import 'dart:math' as math;

class TopContent extends StatelessWidget {
  final bool isDarkMode;

  const TopContent({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        gradient: isDarkMode
            ? const LinearGradient(
                colors: [
                  Colors.black, // First black gradient
                  Colors.white, // Thin white line in the middle
                  Colors.black, // Second black gradient
                ],
                stops: [
                  0.5,
                  1,
                  0.5
                ], // Very narrow transition for the thin line
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                transform: GradientRotation(-math.pi / 2),
              )
            : const LinearGradient(
                colors: [
                  Colors.white, // First white gradient
                  Colors.black, // Thin black line in the middle
                  Colors.white, // Second white gradient
                ],
                stops: [
                  0.5,
                  1,
                  0.5
                ], // Very narrow transition for the thin line
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                transform: GradientRotation(-math.pi / 2),
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
