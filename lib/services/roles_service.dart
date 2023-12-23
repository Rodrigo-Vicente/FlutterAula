import 'dart:convert';
import 'dart:io';
import 'dart:js';
import 'package:aula_mobile_flutter_full06/util.dart';
import 'package:http/http.dart' as http;
import 'package:aula_mobile_flutter_full06/services/session_service.dart';

class rolesService {
  static const appJson = 'application/json; charset=UTF-8';

  final String _baseUrl = 'http://localhost:3030/roles';
  final SessionService _session = SessionService();

  Future<List<dynamic>> getList() async {
    dynamic logged = await _session.getLoggedUser();

    if (logged == null) {
      throw Exception('Sessão expirada');
    }

    String token = logged['token'];

    final Uri uri = Uri.parse(_baseUrl);

    final response = await http.get(uri, headers: <String, String>{
      HttpHeaders.contentTypeHeader: appJson,
      HttpHeaders.authorizationHeader: "Bearer $token"
    });

    if (response.statusCode == 200) {
      return List.from(jsonDecode(response.body));
    }

    throw HttpException(response.body, uri: uri);
  }

  Future<String> createRole(String name, String description) async {
    dynamic logged = await _session.getLoggedUser();

    if (logged == null) {
      throw Exception('Sessão expirada');
    }

    String token = logged['token'];

    final Uri uri = Uri.parse(_baseUrl);
    final response = await http.post(uri,
        headers: <String, String>{
          HttpHeaders.contentTypeHeader: appJson,
          HttpHeaders.authorizationHeader: "Bearer $token"
        },
        body: jsonEncode(<String, String>{
          'name': name,
          'description': description,
        }));
    if (response.statusCode == 201) {
      return ('User created with success');
    } else {
      return ('${response.statusCode}');
    }
  }
}
