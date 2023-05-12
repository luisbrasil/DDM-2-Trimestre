import 'package:aula_11_05/view/dto/contato.dart';
import 'package:flutter/material.dart';
import 'package:aula_11_05/rota.dart';
import 'package:aula_11_05/database/fake/contato_dao.dart';


class ContatoLista extends StatelessWidget {
  const ContatoLista({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista aassa Contatos')),
      body: criarLista(),
      floatingActionButton: criarBotao(context),
      bottomNavigationBar: criarBarraNavegacao(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked
    );
  }

  Widget criarLista() {
    var daoContato = ContatoDAO();
    return FutureBuilder(
      future: daoContato.buscarTodos(),
      builder: (BuildContext context, AsyncSnapshot<List<Contato>> lista){  
        if(lista.hasData) return CircularProgressIndicator();
        if(lista.data == null) return Container();
        List<Contato> listaContato = lista.data!;
        return ListView.builder(
          itemCount: listaContato.length,
          itemBuilder: (context,indice){
            var contato =  listaContato[indice];
            return Text(contato.nome!);
          },
        );
      } 
    );
  }

  BottomAppBar criarBarraNavegacao(){
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Container(height: 50.0),
    );
  }

  FloatingActionButton criarBotao(BuildContext context){
    return FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context,Rota.contatoForm),
      tooltip: 'Adicionar novo contato',
      child: const Icon(Icons.add),
    );
  }
}