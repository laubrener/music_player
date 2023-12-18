import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:music_player/global/environment.dart';
import 'package:music_player/models/login_model.dart';

class AuthService with ChangeNotifier {
  late Usuario usuario;
  bool _authenticating = false;
  final _storage = const FlutterSecureStorage();

  bool get authenticating => _authenticating;
  set authenticating(bool valor) {
    _authenticating = valor;
    notifyListeners();
  }

  static Future<String?> getToken() async {
    const _storage = FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token;
  }

  static Future<void> deleteToken() async {
    const _storage = FlutterSecureStorage();
    await _storage.delete(key: 'token');
  }

  Future login(String email, String password) async {
    authenticating = true;

    final data = {
      'email': email,
      'password': password,
    };

    Uri url = Uri.parse('${Environment.apiUrl}login/');
    final resp = await http.post(url, body: jsonEncode(data), headers: {
      'Content-Type': 'application/json',
    });

    authenticating = false;
    if (resp.statusCode == 200) {
      LoginModel loginResponse = loginModelFromJson(resp.body);
      usuario = loginResponse.usuario;

      await _guardarToken(loginResponse.token);
      return true;
    } else {
      return false;
    }
  }

  Future _guardarToken(String token) async {
    return await _storage.write(key: 'token', value: token);
  }

  Future logout() async {
    return await _storage.delete(key: 'token');
  }
}
