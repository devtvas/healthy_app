import 'package:healthy_app/modules/signin/data/model/user_model.dart';
import 'package:healthy_app/modules/signin/domain/repositories/user_repository.dart';


class SigninController {
  final UserRepository userRepository;

  SigninController({required this.userRepository});

  Future<void> saveUser(UserModel user) async {
    await userRepository.save(user);
  }

  Future<UserModel?> getUser(UserModel username) async {
    return userRepository.get(username);
  }
}
