
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthy_app/modules/home/home_page.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    // TODO: implement binds
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const HomePage(),
    );
  }
}