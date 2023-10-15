
import 'package:healthy_app/core/database/local_storage/local_storage.dart';
import 'package:healthy_app/modules/signin/signin_model.dart';

class SigninController {
  final LocalStorage localStorage;

  SigninController({required this.localStorage});

  Future<void> saveUser(SigninModel user) async {
    await localStorage.saveUser(user);
  }

  Future<SigninModel?> getUser(String username) async {
    return localStorage.getUser(username);
  }
}
