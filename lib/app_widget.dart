import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      title: 'Healthy App',
      theme: ThemeData(
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(primary: Colors.blue),
          ),
          textTheme: const TextTheme(
              bodyText1: TextStyle(
            color: Colors.black,
            // fontFamily: AppFonts.madeTommy,
          ))),
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      locale: const Locale('pt', 'BR'),
      // localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
    );
  }
}