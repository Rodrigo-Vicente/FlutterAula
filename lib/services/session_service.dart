import 'package:localstorage/localstorage.dart';

class SessionService {

  final LocalStorage _storage = LocalStorage('auth_session_user.json');
  final String _key = 'LOGGED_USER';

  Future<void> setLoggedUser(dynamic user) async {
    bool isReady = await _storage.ready;
    if (isReady) {
      await _storage.setItem(_key, user);
    }
  }

  Future<dynamic> getLoggedUser() async {
    bool isReady = await _storage.ready;
    if (isReady) {
      return await _storage.getItem(_key);
    }
  }

  Future<void> removeLoggedUser() async {
    bool isReady = await _storage.ready;
    if (isReady) {
      await _storage.deleteItem(_key);
    }
  }

}