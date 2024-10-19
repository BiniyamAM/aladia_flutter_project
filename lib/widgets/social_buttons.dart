import 'package:flutter/material.dart';

class SocialButtons extends StatelessWidget {
  final bool isDarkMode;

  const SocialButtons({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildSocialButton(
            'Continue with Google', 'assets/google.png', isDarkMode),
        const SizedBox(height: 16),
        _buildSocialButton(
            'Continue with Facebook', 'assets/facebook.png', isDarkMode),
        const SizedBox(height: 16),
        _buildSocialButton(
            'Continue with Apple', 'assets/apple.png', isDarkMode),
      ],
    );
  }

  Widget _buildSocialButton(String text, String assetPath, bool isDarkMode) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: isDarkMode
                  ? Colors.white.withOpacity(0.2)
                  : Colors.black.withOpacity(0.2)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(assetPath, height: 24),
            const SizedBox(width: 16),
            Text(
              text,
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
