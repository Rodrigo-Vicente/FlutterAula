import 'dart:convert';
import 'dart:io';

import 'package:aula_mobile_flutter_full06/services/session_service.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static const appJson = 'application/json; charset=UTF-8';

  final String _baseUrl = 'http://localhost:3030/auth/login';

  final SessionService _session = SessionService();

  Future<dynamic> login(String username, String password) async {
    final response = await http.post(Uri.parse(_baseUrl),
        headers: <String, String>{HttpHeaders.contentTypeHeader: appJson},
        body: jsonEncode(
            <String, String>{'username': username, 'password': password}));

    if (response.statusCode == 201) {
      dynamic user = jsonDecode(response.body);
      await _session.setLoggedUser(user);
      return user;
    }

    return null;
  }
}
