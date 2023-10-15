import 'package:healthy_app/modules/signin/data/model/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../script/signup_script.dart';

class ConnectionSqflite {
  static Database? _database;

  Future<Database> initDB() async {
    if (_database == null) {
      final databasesPath = await getDatabasesPath();
      final path = join(databasesPath, 'healthy.db');

      _database = await openDatabase(
        path,
        version: 1,
        onCreate: (db,v){
          db.execute(Script().saveUser);
        },
      );
    }
    return _database!;
  }

  Future<void> saveUser(UserModel user) async {
    await initDB();
    await _database!.insert('users', user.toMap());
  }

  Future<UserModel?> getUser(String username) async {
    await initDB();
    final List<Map<String, dynamic>> maps = await _database!.query(
      'users',
      where: 'username = ?',
      whereArgs: [username],
    );

    if (maps.isNotEmpty) {
      return UserModel.fromMap(maps.first);
    }
    return null;
  }

  Future<void> closeDatabase() async {
    await _database!.close();
  }
}
