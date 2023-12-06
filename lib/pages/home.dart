import 'package:aula_mobile_flutter_full06/pages/login.dart';
import 'package:aula_mobile_flutter_full06/pages/user.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final _title = 'Listagem de Usuários';

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
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('Usuário 1'),
            Text('Usuário 2'),
            Text('Usuário 3'),
            Text('Usuário 4'),
            Text('Usuário 5'),
          ],
        ),
      ),
    );
  }
}
