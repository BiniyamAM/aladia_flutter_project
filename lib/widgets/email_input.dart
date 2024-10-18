import 'package:aladia/pages/login.dart';
import 'package:flutter/material.dart';
// import '../widgets/login_content.dart'; // Import the LoginContent widget

class EmailInput extends StatelessWidget {
  final bool isDarkMode;

  const EmailInput({Key? key, required this.isDarkMode}) : super(key: key);

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
                  controller: emailController, // Use the controller
                  style: TextStyle(
                      color: isDarkMode ? Colors.black : Colors.black),
                  decoration: InputDecoration.collapsed(
                    hintText: 'Email Address',
                    hintStyle: TextStyle(
                        color: isDarkMode ? Colors.black54 : Colors.black),
                  ),
                  onSubmitted: (value) {
                    // Pop the current route and navigate to MyLogin
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MyLogin(),
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
            // Pop the current route and navigate to MyLogin when 'Enter' button is tapped
            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MyLogin(),
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
