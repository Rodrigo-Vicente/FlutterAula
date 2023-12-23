import 'package:aula_mobile_flutter_full06/pages/createRole.dart';
import 'package:aula_mobile_flutter_full06/pages/editUser.dart';
import 'package:aula_mobile_flutter_full06/pages/login.dart';
import 'package:aula_mobile_flutter_full06/pages/user.dart';
import 'package:aula_mobile_flutter_full06/services/roles_service.dart';
import 'package:aula_mobile_flutter_full06/services/user_service.dart';
import 'package:flutter/material.dart';

class RolerPage extends StatefulWidget {
  const RolerPage({super.key});

  @override
  State<RolerPage> createState() => _RolerPage();
}

class _RolerPage extends State<RolerPage> {
  final _title = 'Listagem de Roles';
  final _service = rolesService();

  Future<List<dynamic>> fetchRoles() async {
    try {
      List<dynamic> list = await _service.getList();
      list.add(
          <String, String>{'name': 'Teste', 'description': 'Apenas um teste'});
      return list;
    } catch (e) {
      // logout
      return [];
    }
  }

  void goToCreateRole(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const CreateRolePage()));
  }

  void logOut(context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: () => goToCreateRole(context),
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
      future: fetchRoles(),
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
                    child: Text(users[index]['description']),
                  )
                ],
              );
            });
      },
    );
  }
}
