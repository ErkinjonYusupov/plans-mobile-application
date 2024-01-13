import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDb {
  Database? db;
  Future open() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'todo2.db');
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE IF NOT EXISTS category(
            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            title varchar(100) not null,
            UNIQUE(title)
          );
          CREATE TABLE IF NOT EXISTS task(
            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            title varchar(100) not null,
            startTime varchar(10) not null,
            endTime varchar(10) not null,
            description varchar(200) not null,
            category varchar(100) not null
          );
        ''');
    });
  }
}
