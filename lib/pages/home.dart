import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:aladia/theme_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Consumer<ThemeProvider>(
              builder: (context, themeProider, child) {
                return Switch(
                  activeColor: Colors.white.withOpacity(0.1),
                  // trackOutlineColor:
                  //     const MaterialStatePropertyAll(Colors.black),
                  inactiveThumbColor: Colors.white.withOpacity(0.1),
                  // ignore: deprecated_member_use
                  thumbColor:
                      // ignore: deprecated_member_use
                      MaterialStatePropertyAll(Colors.black.withOpacity(0.5)),
                  inactiveTrackColor: Colors.black.withOpacity(0.5),
                  // ignore: deprecated_member_use
                  thumbIcon: MaterialStatePropertyAll(
                    themeProider.isSelected
                        ? const Icon(Icons.nights_stay)
                        : const Icon(
                            Icons.wb_sunny,
                            color: Colors.white,
                          ),
                  ),
                  value: themeProider.isSelected,
                  onChanged: (value) {
                    themeProider.toggleTheme();
                  },
                );
              },
            ),
          ),
        ],
      ),
      body: Center(
        // widthFactor: 380,
        child: Container(
          height: 640,
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
            color: Colors.black.withOpacity(0.5),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Stack(
              children: [
                // Borders for gradients
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.7,
                    child: Column(
                      children: [
                        Container(
                          height: 1,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.transparent, Colors.white],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 1,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.white, Colors.transparent],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        _buildTopContent(),
                        const SizedBox(height: 32),
                        _buildEmailInput(),
                        const SizedBox(height: 32),
                        _buildOrDivider(),
                        const SizedBox(height: 32),
                        _buildSocialButtons(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopContent() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
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
              children: const [
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

  Widget _buildEmailInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Enter your email', style: TextStyle(fontSize: 16)),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: const Row(
            children: [
              Icon(Icons.email, color: Colors.black54),
              SizedBox(width: 8),
              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: 'Email Address',
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
            color: Colors.black.withOpacity(0.7),
          ),
          child: const Text(
            'Enter',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildOrDivider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Divider(color: Colors.white.withOpacity(0.1))),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text('Or', style: TextStyle(color: Colors.white)),
        ),
        Expanded(child: Divider(color: Colors.white.withOpacity(0.1))),
      ],
    );
  }

  Widget _buildSocialButtons() {
    return Column(
      children: [
        _buildSocialButton('Continue with Google', 'assets/google.png'),
        const SizedBox(height: 16),
        _buildSocialButton('Continue with Facebook', 'assets/facebook.png'),
        const SizedBox(height: 16),
        _buildSocialButton('Continue with Apple', 'assets/apple.png'),
      ],
    );
  }

  Widget _buildSocialButton(String text, String assetPath) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white.withOpacity(0.2)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(assetPath, height: 24),
            const SizedBox(width: 16),
            Text(text, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
