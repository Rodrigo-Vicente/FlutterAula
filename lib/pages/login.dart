import 'package:aula_mobile_flutter_full06/components/my_button.dart';
import 'package:aula_mobile_flutter_full06/components/my_input.dart';
import 'package:aula_mobile_flutter_full06/pages/home.dart';
import 'package:aula_mobile_flutter_full06/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:aula_mobile_flutter_full06/util.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService authService = AuthService();

  var _username = '';
  var _password = '';

  signIn() {
    authService.login(_username, _password).then((value) {
      if (value != null && value['token'] != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage())
        );
      } else {
        alert(context, 'Usuário/senha inválido(a)!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Acesso')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MyInput(text: 'Login', change: (value) => setState(() => _username = value)),
            MyInput(text: 'Senha', change: (value) => setState(() => _password = value), isObsure: true),
            MyButton(text: 'Entrar', icon: Icons.login, press: signIn),
          ],
        ),
      )
    );
  }
}