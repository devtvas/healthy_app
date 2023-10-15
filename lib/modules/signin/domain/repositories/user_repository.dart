import 'package:healthy_app/modules/signin/data/model/user_model.dart';

abstract class UserRepository {

  get(UserModel user);
  save(UserModel user);
  remove(int id);
  Future<List<UserModel>> list();
}