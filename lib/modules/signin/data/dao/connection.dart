import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'script.dart';

class Connection {
  Database? _db;

  Future<Database> get() async {
    if (_db == null) {
      var path = join(await getDatabasesPath(), 'login.db');
      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, v) {
          db.execute(createTable);
        },
      );
    }
    return _db!;
  }

}
