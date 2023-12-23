import 'package:aula_mobile_flutter_full06/components/my_button.dart';
import 'package:aula_mobile_flutter_full06/components/my_input.dart';
import 'package:aula_mobile_flutter_full06/pages/home.dart';
import 'package:aula_mobile_flutter_full06/services/roles_service.dart';
import 'package:aula_mobile_flutter_full06/services/user_service.dart';
import 'package:aula_mobile_flutter_full06/util.dart';
import 'package:flutter/material.dart';

class EditUserPage extends StatefulWidget {
  const EditUserPage({super.key, required this.userId});

  final String userId;

  @override
  State<EditUserPage> createState() => _EditUserPage();
}

class _EditUserPage extends State<EditUserPage> {
  final _service = UserService();
  final _serviceRoles = rolesService();
  TextEditingController name = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  List<String> selectedRoles = [];

  @override
  void initState() {
    super.initState();
    fetchUserById();
  }

  Future<void> fetchUserById() async {
    try {
      final Map<String, dynamic> userData =
          await _service.getUserById(widget.userId);

      setState(() {
        name.text = userData['name'];
        username.text = userData['username'];
        password.text = userData['password'];
      });
    } catch (error) {
      print('Erro ao buscar usuário: $error');
    }
  }

  Future<void> save() async {
    try {
      final Map<String, dynamic> user = {
        'name': name.text,
        'username': username.text,
        'password': password.text
      };

      await _service.updateUser(widget.userId, user);
      print('Usuário atualizado');

      Navigator.pop(context);
    } catch (error) {
      print('Erro ao atualizar detalhes do usuário: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Editar Usuário'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                  controller: name,
                  decoration: InputDecoration(labelText: 'Nome')),
              TextField(
                  controller: username,
                  decoration: InputDecoration(labelText: 'Login')),
              TextField(
                  controller: password,
                  decoration: InputDecoration(labelText: 'password')),
              MyButton(text: 'Atualizar', icon: Icons.save, press: save),
            ],
          ),
        ));
  }
}
