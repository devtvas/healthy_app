import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthy_app/modules/signin/data/model/user_model.dart';

import 'signin_controller.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final signinController = Modular.get<SigninController>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _handleLogin() async {
    final username =
        UserModel(id: 0, username: usernameController.text, password: '');
    final user = await signinController.getUser(username);

    if (user != null && user.password == passwordController.text) {
      // Login bem-sucedido
      // Navegar para a próxima tela ou executar ação apropriada
      log('bem-sucedido');
      Modular.to.pushNamed('/home');
    } else {
      // Exibir mensagem de erro
      log('erro');
    }
  }

  Future<void> _handleRegister() async {
    final username = usernameController.text;
    final password = passwordController.text;
    if (username.isNotEmpty && password.isNotEmpty) {
      final user = UserModel(id: 0, username: username, password: password);
      await signinController.saveUser(user);
      // Redirecionar para a página de login ou realizar outra ação apropriada
      Modular.to.pop();
    } else {
      // Exibir mensagem de erro se campos estiverem vazios
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            ElevatedButton(
              onPressed: _handleLogin,
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: _handleRegister,
              child: Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }
}
