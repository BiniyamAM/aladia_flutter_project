import 'package:aladia/service/tokenService.dart';
import 'package:flutter/material.dart';

class LoggedIn extends StatefulWidget {
  const LoggedIn({super.key});

  @override
  _LoggedInState createState() => _LoggedInState();
}

class _LoggedInState extends State<LoggedIn> {
  String? _token;

  @override
  void initState() {
    super.initState();
    _fetchToken();
  }

  Future<void> _fetchToken() async {
    TokenService tokenService = TokenService();
    String? token = await tokenService.getAccessToken();
    setState(() {
      _token = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome to the Home Page"),
            const SizedBox(height: 10),
            const Text("Your Token is"),
            const SizedBox(height: 10),
            Text(_token ?? "Fetching token..."),
          ],
        ),
      ),
    );
  }
}
