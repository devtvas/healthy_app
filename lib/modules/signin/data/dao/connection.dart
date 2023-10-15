import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'script.dart';

class Connection {
  Database? db;
  Connection({this.db});
  Future<Database> get() async {
    if (db == null) {
      var path = join(await getDatabasesPath(), 'login.db');
      db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, v) {
          db.execute(createTable);
        },
      );
    }
    return db!;
  }
}
