import 'package:aladia/pages/home.dart';
import 'package:aladia/pages/logged_in.dart';
import 'package:aladia/provider/authProvider.dart';
import 'package:aladia/provider/theme_provider.dart';
import 'package:aladia/widgets/top_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginContent extends StatelessWidget {
  final bool isDarkMode;

  const LoginContent({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    final authProvider = Provider.of<AuthProvider>(context);

    return Container(
      color: isDarkMode ? Colors.black : Colors.white,
      padding: const EdgeInsets.all(5),
      alignment: Alignment.center, // Center the content horizontally
      child: SizedBox(
        width: 350, // Set a consistent width for the whole content
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                        create: (context) => ThemeProvider(),
                        child: const Home()),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
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
                border: Border.all(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              child: TextField(
                controller: passwordController,
                style:
                    TextStyle(color: isDarkMode ? Colors.white : Colors.black),
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
                print("password clicked");

                authProvider.setPassword(passwordController.text);
                authProvider.login().then((_) {
                  if (authProvider.errorMessage != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(authProvider.errorMessage!)),
                    );
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider(
                            create: (context) => ThemeProvider(),
                            child:
                                const LoggedIn()), // Change to your desired page
                      ),
                    );
                  }
                });
              },
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 322,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isDarkMode
                        ? Colors.white.withOpacity(0.5)
                        : Colors.black.withOpacity(0.5), // Border color
                  ),
                  color: isDarkMode
                      ? Colors.black
                      : Colors.white, // Solid background color
                ),
                child: authProvider.isLoading
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          isDarkMode
                              ? Colors.white
                              : const Color.fromARGB(255, 56, 54, 54),
                        ),
                      )
                    : Text(
                        'Enter',
                        style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
