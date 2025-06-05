import 'package:path/path.dart';
import 'package:ppkd_flutter_masitha/meet_16/Tugas_11_flutter/model/game_model.dart';
import 'package:sqflite/sqflite.dart';

//tugas
class DbHelper1 {
  static Future<Database> initDB() async {
    final dbpath = await getDatabasesPath();

    return openDatabase(
      version: 1,
      join(dbpath, 'tugas11flutter.db'),
      onCreate: (db, version) {
        return db.execute('''CREATE TABLE games(
          id INTEGER PRIMARY KEY AUTOINCREMENT, 
          nama_pengguna TEXT, 
          game TEXT, 
          ulasan TEXT, 
          genre TEXT, 
          rating TEXT
          )''');
      },
    );
  }

  static Future<void> insertGame(GameModel game) async {
    final db = await DbHelper1.initDB();
    await db.insert(
      'games',
      game.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<GameModel>> getAllGame() async {
    final db = await DbHelper1.initDB();
    final List<Map<String, dynamic>> maps = await db.query('games');

    return List.generate(maps.length, (i) => GameModel.fromMap(maps[i]));
    // }
  }
}
//ini comment