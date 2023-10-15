import 'package:healthy_app/modules/signin/data/model/user_model.dart';
import 'package:sqflite/sqflite.dart';

class AuthService {
  final Database database;

  AuthService(this.database);

  Future<UserModel?> authenticateUser(
      String username, String password) async {
    final List<Map<String, dynamic>> maps = await database.query(
      'users',
      where: 'username = ?',
      whereArgs: [username],
    );

    if (maps.isNotEmpty) {
      final user = UserModel.fromMap(maps.first);
      if (user.password == password) {
        return user;
      }
    }

    return null;
  }
}
