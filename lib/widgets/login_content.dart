import 'package:aladia/pages/home.dart';
import 'package:aladia/provider/authProvider.dart';
import 'package:aladia/provider/theme_provider.dart';
import 'package:aladia/widgets/top_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Make sure to import your AuthProvider

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
              width: 350,
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
              controller: passwordController, // Use the controller
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
              print("password clicked");
              // Set the password in the AuthProvider and call login

              authProvider.setPassword(passwordController.text);
              authProvider.login().then((_) {
                // Navigate to another page or show success/error message
                if (authProvider.errorMessage != null) {
                  // Show error message, for example using a Snackbar
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(authProvider.errorMessage!)),
                  );
                } else {
                  // Navigate to a new page on successful login
                  print("successfull");
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                          create: (context) => ThemeProvider(),
                          child: const Home()), // Change to your desired page
                    ),
                  );
                }
              });
            },
            child: Container(
              alignment: Alignment.center,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.transparent),
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
                          Colors.white.withOpacity(0.7),
                          Colors.grey.withOpacity(0.3),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
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
    );
  }
}
