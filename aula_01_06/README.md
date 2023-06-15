# Aula_01_06 - Persistência local

## Classe de Conexão

É a classe que faz a instanciação o banco de dados atraves da conexão, no exemplo abaixo também passamos um script inicial para a criação de um tabela em específico, nesse caso o criarReview que cria a tabela criarReview, e a insercoesReview é uma lista de Inserts que são feitos quando a conexão com o banco é feita.


```
class Conexao {
  static late Database _database;
  static bool _fechado = true;

  static Future<Database> criar() async {
    if (_fechado) {
      String path = join(await getDatabasesPath(),
          'banco.db');
          deleteDatabase(path); //definindo o camminho do database
      _database = await openDatabase(
        path, // informando o caminho
        version: 1, // versão
        onCreate: (db, v) {
          db.execute(criarReview);
          insercoesReview.forEach(db.execute);
        },
      );
      _fechado = false;
    }
    return _database;
  }
}
```

## Classe DAO

A Classe DAO serve para interagirmos com o banco ao qual fizemos a conexão, dividimos os DAOS pelas entidades, cada entidade terá um DAO contendo os métodos que julgarmos necessários na relação com o banco, no caso é um padrão termos o CRUD(Create, Read, Update e Delete), no caso do READ, é padrão também termos uma consulta por ID que retorna um único registro e uma consultaTodos que retornará todos os registros da tabela.

Segue o exemplo do CRUD da entidade Review, que utilizamos na classe de Conexão

```
import 'package:oktopus/database/sqlite/conexao.dart';
import 'package:oktopus/view/dto/review.dart';
import 'package:oktopus/view/interface/review_interface_dao.dart';
import 'package:sqflite/sqlite_api.dart';

class ReviewDAOSQLite implements ReviewInterfaceDao {
  @override
  Future<Review> consultar(int id) async {
    Database db = await Conexao.criar();
    List<Map> maps = await db.query('Review', where: 'id = ?', whereArgs: [id]);
    if (maps.isEmpty)
      throw Exception('Não foi encontrado registro com este id');
    Map<dynamic, dynamic> resultado = maps.first;
    return converterReview(resultado);
  }

  @override
  Future<List<Review>> consultarTodos() async {
    Database db = await Conexao.criar();
    List<Review> lista =
        (await db.query('review')).map<Review>(converterReview).toList();
    return lista;
  }

  @override
  Future<bool> excluir(id) async {
    Database db = await Conexao.criar();
    var sql = 'DELETE FROM review WHERE id = ?';
    int linhasAfetas = await db.rawDelete(sql, [id]);
    return linhasAfetas > 0;
  }

  @override
  Future<Review> salvar(Review review) async {
    Database db = await Conexao.criar();
    String sql;
    if (review.id == null) {
      sql =
          'INSERT INTO review (agendamento, descricao,estrelas) VALUES (?,?,?)';
      int id = await db.rawInsert(
          sql, [review.agendamento, review.descricao, review.estrelas]);
      review = Review(
          id: id,
          agendamento: review.agendamento,
          descricao: review.descricao,
          estrelas: review.estrelas);
    } else {
      sql =
          'UPDATE contato SET agendamento = ?, descricao =?, estrelas = ? WHERE id = ?';
      db.rawUpdate(sql,
          [review.agendamento, review.descricao, review.estrelas, review.id]);
    }
    return review;
  }

  Review converterReview(Map<dynamic, dynamic> resultado) {
    return Review(
        id: resultado['id'],
        agendamento: resultado['agendamento'],
        descricao: resultado['descricao'],
        estrelas: resultado['estrelas']);
  }
}
```

Nota-se que podemos escrever comandos em SQL específicos em uma string e utiliza-los nas nossas chamadas ao banco, nesse caso utilizando a extensão do SQLite para o Dart.
