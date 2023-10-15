import 'signin_entity.dart';

class SigninModel extends SigninEntity {
  SigninModel({
    required super.id,
    required super.username,
    required super.password,
  });

factory SigninModel.fromMap(Map<String, dynamic> map) {
    return SigninModel(
      id: map['id'],
      username: map['username'],
      password: map['password'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
    };
  }
}
