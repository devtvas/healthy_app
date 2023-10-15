import 'package:flutter_modular/flutter_modular.dart';

import 'data/dao/connection.dart';
import 'data/repositories/user_repository_impl.dart';
import 'domain/repositories/user_repository.dart';
import 'presentation/signin_controller.dart';
import 'presentation/signin_page.dart';

class SigninModule extends Module {
  @override
  List<Module> get imports => [
        // SharedModule(
        //   sharedPreferences: sharedPreferences,
        // ),
      ];

  @override
  void binds(Injector i) {
    i.addSingleton<Connection>(() => Connection(db: i.get()));
    // CONTROLLERS
    i.add<SigninController>(() => SigninController(userRepository: i.get()));

    // REPOSITORIES
    i.add<UserRepository>(() => UserRepositoryImpl(connection: i.get()));

    // DATASOURCES
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const SigninPage(),
    );
  }
}
