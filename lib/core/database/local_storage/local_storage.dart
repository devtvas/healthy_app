// import 'package:healthy_app/modules/signin/signin_model.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class LocalStorage {
//   Database? _database;

//   Future<void> initDatabase() async {
//     final databasesPath = await getDatabasesPath();
//     final path = join(databasesPath, 'signup.db');

//     _database = await openDatabase(
//       path,
//       version: 1,
//       onCreate: _onCreate,
//     );
//   }

//   void _onCreate(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE users(
//         id INTEGER PRIMARY KEY,
//         username TEXT,
//         password TEXT
//       )
//     ''');
//   }

//   Future<void> saveUser(SigninModel user) async {
//     await initDatabase();
//     await _database!.insert('users', user.toMap());
//   }

//   Future<SigninModel?> getUser(String username) async {
//     await initDatabase();
//     final List<Map<String, dynamic>> maps = await _database!.query(
//       'users',
//       where: 'username = ?',
//       whereArgs: [username],
//     );

//     if (maps.isNotEmpty) {
//       return SigninModel.fromMap(maps.first);
//     }
//     return null;
//   }

//   Future<void> closeDatabase() async {
//     await _database!.close();
//   }
// }
