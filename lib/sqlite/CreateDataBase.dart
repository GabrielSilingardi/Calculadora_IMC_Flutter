import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

Map<int, String> scripts = {
  1: '''

    CREATE TABLE dados (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      Nome TEXT,
      Peso REAL,
      Altura REAL,
      IMC REAL,
      Condicao TEXT
    )
    
    '''
};

class Createdatabase {

  static Database? db;

  Future<Database> obterDataBase() async {
    if (db == null) {
      return await iniciarDataBase();
    } else {
      return db!;
    }
  }

  Future iniciarDataBase() async {
    db = await openDatabase(
      path.join(await getDatabasesPath(), "database.db"),
      version: 1,
      onCreate: (db, version) async {
        for (var i = 1; i <= scripts.length; i++) {
          await db.execute(scripts[i]!);
        }
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        for (var i = oldVersion; i <= scripts.length; i++) {
          await db.execute(scripts[i]!);
        }
      },
    );
    return db;
  }
}