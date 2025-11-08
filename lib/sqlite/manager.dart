import 'package:calculadora_imc/sqlite/CreateDataBase.dart';

class Manager {

  Future<List<dynamic>> obterDados() async {
    var db = await Createdatabase().obterDataBase();

    var table = await db.rawQuery("SELECT id, Nome, Peso, Altura, IMC, Condicao FROM dados");

    return table;
  }

  Future<void> salvar(int id, String nome, double peso, double altura, double imc, String condicao) async {
    var db = await Createdatabase().obterDataBase();

    db.rawInsert("INSERT INTO dados (Nome, Peso, Altura, IMC, Condicao) values(?, ?, ?, ?, ?)", [
      nome, peso, altura, imc, condicao
    ]);
  }

  Future<void> deletar(int id) async {
    var db = await Createdatabase().obterDataBase();

    db.rawDelete("DELETE FROM dados WHERE id = ?", [id]);

  }

}