import 'package:shared_preferences/shared_preferences.dart';

class TokenService {
  Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken');
  }

  Future getToken() async {
    String? accessToken = await getAccessToken();
    if (accessToken != null) {
      print('Access Token: $accessToken');
      return accessToken;
    } else {
      print('No access token found');
    }
  }

  void setAccessToken(String accessToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', accessToken);
  }
}
