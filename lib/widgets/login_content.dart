import 'package:aladia/pages/home.dart';
import 'package:aladia/widgets/top_content.dart';
import 'package:flutter/material.dart';

class LoginContent extends StatelessWidget {
  final bool isDarkMode;

  const LoginContent({Key? key, required this.isDarkMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Set the background color based on dark mode
      color: isDarkMode ? Colors.black : Colors.white,
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              // Navigate to the Home widget
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const Home(),
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              height: 32,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Back to Log in',
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          TopContent(isDarkMode: isDarkMode),
          const SizedBox(height: 10),
          Text(
            'Enter your password',
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(8),
              border:
                  Border.all(color: isDarkMode ? Colors.white : Colors.black),
            ),
            child: TextField(
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.key,
                  color: isDarkMode ? Colors.white70 : Colors.black54,
                ),
                hintText: 'Password',
                hintStyle: TextStyle(
                    color: isDarkMode ? Colors.white54 : Colors.black54),
                border: InputBorder.none,
              ),
              obscureText: true,
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              // Implement forgot password action here
            },
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                color: isDarkMode ? Colors.white70 : Colors.black54,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              // Implement enter action here
            },
            child: Container(
              alignment: Alignment.center,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  colors: isDarkMode
                      ? [
                          Colors.black.withOpacity(0.7),
                          Colors.grey.withOpacity(0.7),
                        ]
                      : [
                          Colors.white.withOpacity(0.1),
                          Colors.grey.withOpacity(0.1),
                        ],
                ),
              ),
              child: Text(
                'Enter',
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
