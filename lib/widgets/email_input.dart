import 'package:aladia/pages/login.dart';
import 'package:aladia/provider/authProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Ensure you import your login page

class EmailInput extends StatelessWidget {
  final bool isDarkMode;

  const EmailInput({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Enter your email',
          style: TextStyle(
              fontSize: 16, color: isDarkMode ? Colors.white : Colors.black),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isDarkMode ? Colors.white : Colors.black.withOpacity(0.05),
          ),
          child: Row(
            children: [
              Icon(Icons.email,
                  color: isDarkMode ? Colors.black54 : Colors.black),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: emailController,
                  style: TextStyle(
                      color: isDarkMode ? Colors.black : Colors.black),
                  decoration: InputDecoration.collapsed(
                    hintText: 'Email Address',
                    hintStyle: TextStyle(
                        color: isDarkMode ? Colors.black54 : Colors.black),
                  ),
                  onSubmitted: (value) {
                    // Use the Provider to set the email
                    Provider.of<AuthProvider>(context, listen: false)
                        .setEmail(emailController.text);
                    // Navigate to the login page
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider.value(
                          value:
                              Provider.of<AuthProvider>(context, listen: false),
                          child: MyLogin(),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () {
            // Use the Provider to set the email
            Provider.of<AuthProvider>(context, listen: false)
                .setEmail(emailController.text);
            // Navigate to the login page
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider.value(
                  value: Provider.of<AuthProvider>(context, listen: false),
                  child: MyLogin(),
                ),
              ),
            );
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
            child: Text(
              'Enter',
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
            ),
          ),
        )
      ],
    );
  }
}
