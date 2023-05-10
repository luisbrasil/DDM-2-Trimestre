import 'package:aula_09_05/dtos/testeDTO.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Formulario2 extends StatelessWidget {
  var keyForm = GlobalKey<FormState>();
  var editorCEP = TextEditingController();
  var editorCPF = TextEditingController();
  var editorXy = TextEditingController();
  var editorProduto = TextEditingController();
  var cpfMask = MaskTextInputFormatter(
        mask: '###.###.###-##',
        filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: Form(
        key: keyForm,
        child: Column(children: [
          TextFormField(
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CepInputFormatter(),
            ],
            controller: editorCEP,
            decoration: const InputDecoration(
                label: Text('CEP: '), hintText: 'Informe o seu CEP'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'O campo é obrigatório';
              }
              return null;
            },
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            inputFormatters: [
              cpfMask
            ],
            controller: editorCPF,
            decoration: const InputDecoration(
                label: Text('CPF: '), hintText: 'Informe o seu CPF'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'O campo é obrigatório';
              }
              return null;
            },
          ),
          TextFormField(
            inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'[xy]'))],
            controller: editorXy,
            decoration: const InputDecoration(
                label: Text('Digite x ou y: '), hintText: 'Digite x ou y se for capaz'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'O campo é obrigatório';
              }
              return null;
            },
          ),
          TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-z0-9]'))
            ],
            controller: editorProduto,
            decoration: const InputDecoration(
                label: Text('Digite o nome do produto: '),
                hintText: 'Não pode conter caracteres especiais'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'O campo é obrigatório';
              }
              return null;
            },
          ),
          ElevatedButton(
              onPressed: () {
                var testeDTO = TesteDTO(editorCEP.text, editorCPF.text, editorXy.text, editorProduto.text);
                if (keyForm.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(testeDTO.toString())));
                }
              },
              child: const Text('Confirmar'))
        ]),
      ),
    );
  }
}
