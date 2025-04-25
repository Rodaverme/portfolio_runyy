import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthServices extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyAHDiJLo1Q9LKaA-K9hfgF4fTel75gTMN0';

  String? _token;
  String? _userId;

  String? get userId => _userId;

  bool get isAuthenticated => _token != null;

  Future<String?> createUser(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };
    final url = Uri.https(_baseUrl, '/v1/accounts:signUp', {
      'key': _firebaseToken,
    });

    final response = await http.post(
      url,
      body: jsonEncode(authData),
    );

    final Map<String, dynamic> responseData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      notifyListeners();
      return _token;
    } else {
      return null;
    }
  }

  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };
    final url = Uri.https(_baseUrl, '/v1/accounts:signInWithPassword', {
      'key': _firebaseToken,
    });

    final response = await http.post(
      url,
      body: jsonEncode(authData),
    );

    final Map<String, dynamic> responseData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      notifyListeners();
      print(_token);
      return _token;
    } else {
      return null;
    }
  }

  void logout() {
    _token = null;
    _userId = null;
    notifyListeners();
  }

  String? getToken() {
    return _token;
  }

  bool isTokenExpired(String token) {
    final payload = token.split('.')[1];
    final decodedPayload = utf8.decode(base64Url.decode(base64Url.normalize(payload)));
    final Map<String, dynamic> payloadData = jsonDecode(decodedPayload);
    final exp = payloadData['exp'] as int;
    final currentTime = DateTime.now().millisecondsSinceEpoch / 1000;
    return exp < currentTime;
  }
  Future<void> refreshToken() async {
    if (_token == null) return;
    final url = Uri.https(_baseUrl, '/v1/token', {
      'key': _firebaseToken,
    });

    final response = await http.post(
      url,
      body: jsonEncode({
        'grant_type': 'refresh_token',
        'refresh_token': _token,
      }),
    );

    final Map<String, dynamic> responseData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      _token = responseData['id_token'];
      notifyListeners();
    } else {
      logout();
    }
  }

}
