import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthy_app/core/database/local_storage/local_storage.dart';
import 'package:healthy_app/modules/signin/signin_page.dart';

import 'signin_controller.dart';

class SigninModule extends Module {
  @override
  List<Module> get imports => [
        // SharedModule(
        //   sharedPreferences: sharedPreferences,
        // ),
      ];

  @override
  void binds(Injector i) {
    // CONTROLLERS
    i.addSingleton<SigninController>(
        () => SigninController(localStorage: LocalStorage()));

    // // REPOSITORIES
    // i.add<AuthRepository>(() => AuthRepositoryImpl(authDatasource: i.get()));

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
