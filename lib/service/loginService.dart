import 'dart:convert';
import 'package:aladia/service/tokenService.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final String baseUrl = 'https://dev-api.aladia.io/v2/auth';
  final _tokenService = TokenService();

  Future<bool> login(String username, String password) async {
    print('Login called');
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({
          'email': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // Handle successful login, e.g., save token
        final responseData = json.decode(response.body);
        final accessToken = responseData['accessToken'];

        // Save the token to local storage
        // Assuming you are using the shared_preferences package
        _tokenService.setAccessToken(accessToken);
        print('Login successful');
        return true;
      } else if (response.statusCode == 401 || response.statusCode == 403) {
        // Unauthorized or forbidden, likely due to wrong credentials
        print('Invalid credentials: ${response.statusCode}');
        return false;
      } else {
        // Handle any other error response from the server
        print('Login failed with status: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error during login: $e');
      return false;
    }
  }
}
