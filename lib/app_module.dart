import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthy_app/modules/home/home_module.dart';

import 'modules/signin/signin_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        // SharedModule(
        //   sharedPreferences: sharedPreferences,
        // ),
      ];

  @override
  void routes(r) {
    r.module(Modular.initialRoute, module: SigninModule());
    r.module('/home', module: HomeModule());
  }
}
