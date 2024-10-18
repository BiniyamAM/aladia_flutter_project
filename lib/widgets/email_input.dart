import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  final bool isDarkMode;

  const EmailInput({Key? key, required this.isDarkMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  style: TextStyle(
                      color: isDarkMode ? Colors.black : Colors.black),
                  decoration: InputDecoration.collapsed(
                    hintText: 'Email Address',
                    hintStyle: TextStyle(
                        color: isDarkMode ? Colors.black54 : Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          alignment: Alignment.center,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.transparent),
            color: isDarkMode
                ? Colors.black.withOpacity(0.7)
                : Colors.black.withOpacity(0.1),
          ),
          child: Text(
            'Enter',
            style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
          ),
        ),
      ],
    );
  }
}
