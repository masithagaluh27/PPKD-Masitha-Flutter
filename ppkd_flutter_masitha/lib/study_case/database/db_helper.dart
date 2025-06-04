import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Future<Database> initDB() async {
    final dbpath = await getDatabasesPath();

    return openDatabase(
      join(dbpath, 'siswa.db'),
      onCreate: (db, Version) {
        return db.execute(
          'CREATE TABLE siswa(id INTEGER PRIMARY AUTOINCREMENT, name TEXT, umur INTEGER)',
        );
      },
      version: 1,
    );
  }

  // Future<void> insertSiswa({Siswa, siswa}) async {
  //   final db = await DbHelper.db();
  //   await db.insert(
  //     'siswa',
  //     siswa.toMap(),
  //     ConflictAlgorithm: ConflictAlgorithm.replace,
  //   );
  // }

  // Future<Siswa?> getAllSiswa() async {
  //   final db = await DbHelper.db();
  //   final List<Map<String, dynamic>> maps = await db.query('siswa');

  //   return List.generate(growable: maps.length, (i) => Siswa.fromMap(maps[i]));
  // }
}
