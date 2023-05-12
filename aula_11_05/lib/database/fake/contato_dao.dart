import 'package:aula_11_05/view/dto/contato.dart';
import 'package:aula_11_05/view/interface/contato_dao_interface.dart';

class ContatoDAO implements ContatoDAOInterface {
  var listaContatos = <Contato>[
    Contato(
        id: 1,
        nome: 'Felipe da Hora',
        email: 'lipedahora2000@gmail.com',
        telefone: '(44) 99864-8549',
        URLAvatar:
            'https://cdn.pixabay.com/photo/2013/07/12/19/15/gangster-154425_1280.png'),
    Contato(
        id: 2,
        nome: 'Pedro Kusiak',
        email: 'pedrokz@gmail.com',
        telefone: '(44) 92132-1319',
        URLAvatar:
            'https://cdn.pixabay.com/photo/2016/03/31/20/27/anthropomorphized-animals-1295774_1280.png'),
    Contato(
        id: 3,
        nome: 'Vinicius Koiti',
        email: 'viniciuskkkkkkkkkkkkkkkkkkkkkkkkkkkkoiti@gmail.com',
        telefone: '(44) 99888-2222',
        URLAvatar:
            'https://cdn.pixabay.com/photo/2013/07/13/13/56/chinese-161791_1280.png')
  ];

  @override
  Future<Contato> alterar(Contato contato) {
    print(contato);
    return Future.value(contato);
  }

  @override
  Future<Contato> buscar(id) {
    return Future.value(listaContatos[id-1]);
  }

  @override
  Future<List<Contato>> buscarTodos() {
    return Future.value(listaContatos);
  }

  @override
  Future<bool> deletar(id) {
    print(id);
    return Future.value(true);
  }

  @override
  Future<Contato> salvar(Contato contato) {
    print(contato);
    return Future.value(contato);
  }
}
