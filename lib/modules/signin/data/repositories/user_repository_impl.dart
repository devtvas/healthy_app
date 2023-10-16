import 'package:healthy_app/modules/signin/data/model/user_model.dart';
import 'package:sqflite/sqflite.dart';

import '../../domain/repositories/user_repository.dart';
import '../dao/connection.dart';

class UserRepositoryImpl implements UserRepository {
  Connection connection;
  UserRepositoryImpl({required this.connection});

  @override
  Future<UserModel> get(UserModel user) async {
    Database? database;
    database = (await connection.get());
    final List<Map<String, dynamic>> maps = await database.query(
      'users',
      where: 'username = ?',
      whereArgs: [user.username],
    );

    if (maps.isNotEmpty) {
      return UserModel.fromMap(maps.first);
    }
    return user;
  }

  @override
  Future<List<UserModel>> list() {
    // TODO: implement list
    throw UnimplementedError();
  }

  @override
  remove(int id) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  save(UserModel user) async {
    Database database;

    database = (await connection.get());
    await database.insert('users', user.toMap());
  }
}
