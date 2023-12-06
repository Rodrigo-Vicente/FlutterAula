import 'package:aula_mobile_flutter_full06/components/my_button.dart';
import 'package:aula_mobile_flutter_full06/components/my_input.dart';
import 'package:aula_mobile_flutter_full06/util.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  var _name = '';
  var _username = '';
  var _password = '';
  var _confirmPass = '';

  void save() {
    if (_name.trim().isEmpty) {
      alert(context, 'Nome é obrigatório');
      return;
    }
    if (_username.trim().isEmpty) {
      alert(context, 'Login é obrigatório');
      return;
    }
    if (_password.trim().isEmpty) {
      alert(context, 'Senha é obrigatória');
      return;
    }
    if (_password != _confirmPass) {
      alert(context, 'Senha não confere');
      return;
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Usuário'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MyInput(text: 'Nome', change: (value) => setState(() => _name = value)),
            MyInput(text: 'Login', change: (value) => setState(() => _username = value)),
            MyInput(text: 'Senha', change: (value) => setState(() => _password = value), isObsure: true),
            MyInput(text: 'Confirmar Senha', change: (value) => setState(() => _confirmPass = value), isObsure: true),
            MyButton(text: 'Salvar', icon: Icons.save, press: save),
          ],
        ),
      )
    );
  }
}