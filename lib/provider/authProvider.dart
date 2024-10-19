import 'package:aladia/service/loginService.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  String? _email;
  String? _password;
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void setEmail(String email) {
    _email = email;
    print(_email);
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  Future<void> login() async {
    print("providder called");
    print(_email);
    print(_password);
    if (_email == null || _password == null) return;

    _isLoading = true;
    notifyListeners();

    final success = await _apiService.login(_email!, _password!);
    print(success);
    _isLoading = false;

    if (!success) {
      _errorMessage = 'Login failed';
    } else {
      _errorMessage = null; // Clear the error message on success
    }

    notifyListeners();
  }
}
