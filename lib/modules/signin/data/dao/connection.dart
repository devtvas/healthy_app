import 'dart:async';
import 'package:healthy_app/modules/signin/data/dao/script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connection {

  Future<Database> get() async {
   Database? database;
    var path = join(await getDatabasesPath(), 'login.db');
    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, v) {
        db.execute(createTable);
      },
    );
      return database;
  }

}
