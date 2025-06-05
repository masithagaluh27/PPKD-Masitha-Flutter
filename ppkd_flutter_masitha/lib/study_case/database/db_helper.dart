import 'package:path/path.dart';
import 'package:ppkd_flutter_masitha/study_case/model/siswa_model.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Future<Database> db() async {
    final dbpath = await getDatabasesPath();

    return openDatabase(
      join(dbpath, 'siswa.db'),
      onUpgrade: (db, oldVersion, newVersion) {
        return db.execute(
          'CREATE TABLE siswi(id INTEGER PRIMARY KEY AUTOINCREMENT, nama TEXT, umur INTEGER)',
        );
      },
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE siswa(id INTEGER PRIMARY KEY AUTOINCREMENT, nama TEXT, umur INTEGER)',
        );
      },
      version: 3,
    );
  }

  static Future<void> insertSiswa(Siswa siswa) async {
    final db = await DBHelper.db();
    await db.insert(
      'siswi',
      siswa.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Siswa>> getAllSiswa() async {
    final db = await DBHelper.db();
    final List<Map<String, dynamic>> maps = await db.query('siswi');

    return List.generate(maps.length, (i) => Siswa.fromMap(maps[i]));
    // }
  }
}
