import 'package:healthy_app/modules/signin/data/model/user_model.dart';
import 'package:sqflite/sqflite.dart';

import '../../domain/repositories/user_repository.dart';
import '../dao/connection.dart';

class UserRepositoryImpl implements UserRepository {
  Connection connection;
  UserRepositoryImpl({required this.connection});

  @override
  get(UserModel user) {
    // TODO: implement get
    throw UnimplementedError();
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

    database = await connection.get();
    await database.insert('users', user.toMap());
  }
}
