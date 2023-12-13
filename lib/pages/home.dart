import 'package:aula_mobile_flutter_full06/pages/login.dart';
import 'package:aula_mobile_flutter_full06/pages/user.dart';
import 'package:aula_mobile_flutter_full06/services/user_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _title = 'Listagem de Usuários';
  final _service = UserService();

  Future<List<dynamic>> fetchUsers() async {
    try {
      List<dynamic> list = await _service.getList();
      list.add(<String, String> { 'id': '2', 'name': 'Fulano de Tal', 'username': 'fulanotal' });
      return list;
    } catch (e) {
      // logout
      return [];
    }
  }

  void goToCreateUser(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserPage())
    );
  }

  void logOut(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: () => goToCreateUser(context),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => logOut(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: _buildList(),
      ),
    );
  }

  Widget _buildList() {
    return FutureBuilder(
      future: fetchUsers(),
      builder: (context, snapshot) {
        List<dynamic> users = snapshot.data ?? [];

        return ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(users[index]['name']),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(users[index]['username']),
                )
              ],
            );
          }
        );
      },
    );
  }
}
