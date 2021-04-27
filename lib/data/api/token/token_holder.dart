import 'dart:convert' show json;

import 'package:flutter/services.dart' show rootBundle;

class TokenHolder {
  static const _apiKey = 'api_key';
  static const _configPath = 'config.json';
  String _token = '';

  Future<String> get token async {
    if (_token.isEmpty) {
      await loadToken();
    }
    return _token;
  }

  Future<void> loadToken() async {
    final jsonString = await rootBundle.loadString(_configPath);
    _token = json.decode(jsonString)[_apiKey];
  }
}
