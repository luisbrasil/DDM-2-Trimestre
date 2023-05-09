import 'package:aula_09_05/dtos/pessoaDTO.dart';
import 'package:flutter/material.dart';

class Formulario extends StatelessWidget{
  var keyForm = GlobalKey<FormState>();
  var editorNome = TextEditingController();
  var editorSobrenome = TextEditingController();
  var editorCPF = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: Form(
        key: keyForm,
        child: Column(
          children: [
            TextFormField(
              controller: editorNome,
              decoration: InputDecoration(
                label: Text('Nome: '),
                hintText: 'Informe o seu nome'
              ),
              validator: (value) {
                if(value == null || value.isEmpty){
                  return 'O campo é obrigatório';
                }
                return null;
              },
            ),
            TextFormField(
              controller: editorSobrenome,
              decoration: InputDecoration(
                label: Text('Sobrenome: '),
                hintText: 'Informe o seu Sobrenome'
              ),
              validator: (value) {
                if(value == null || value.isEmpty){
                  return 'O campo é obrigatório';
                }
                return null;
              },
            ),
            TextFormField(
              maxLength: 14,
              keyboardType: TextInputType.number,
              controller: editorCPF,
              decoration: InputDecoration(
                label: Text('CPF: '),
                hintText: 'Informe o seu CPF'
              ),
              validator: (value) {
                if(value == null || value.isEmpty){
                  return 'O campo é obrigatório';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: (){
                if(keyForm.currentState!.validate()){
                  var pessoaDTO = PessoaDTO(editorNome.text, editorSobrenome.text, editorCPF.text);
                  ScaffoldMessenger.of(context).showSnackBar(
                   SnackBar(content: Text(pessoaDTO.toString()))
                );
                }
              },
              child: Text('Confirmar'))
          ]
        ),
      ),
    );
  }
}