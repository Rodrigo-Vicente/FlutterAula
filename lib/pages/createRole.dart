import 'package:aula_mobile_flutter_full06/components/my_button.dart';
import 'package:aula_mobile_flutter_full06/components/my_input.dart';
import 'package:aula_mobile_flutter_full06/pages/rolesList.dart';
import 'package:aula_mobile_flutter_full06/services/roles_service.dart';
import 'package:aula_mobile_flutter_full06/util.dart';
import 'package:flutter/material.dart';

class CreateRolePage extends StatefulWidget {
  const CreateRolePage({super.key});

  @override
  State<CreateRolePage> createState() => _CreateRolePage();
}

class _CreateRolePage extends State<CreateRolePage> {
  final _service = rolesService();
  var _name = '';
  var _description = '';

  void save() {
    if (_name.trim().isEmpty) {
      alert(context, 'Nome é obrigatório');
      return;
    }
    if (_description.trim().isEmpty) {
      alert(context, 'Descrição é obrigatório');
      return;
    }
    _service.createRole(_name, _description).then((value) {
      if (value != null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const RolerPage()));
      }
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Nova role'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MyInput(
                  text: 'Nome',
                  change: (value) => setState(() => _name = value)),
              MyInput(
                  text: 'Descrição',
                  change: (value) => setState(() => _description = value)),
              MyButton(text: 'Salvar', icon: Icons.save, press: save),
            ],
          ),
        ));
  }
}
