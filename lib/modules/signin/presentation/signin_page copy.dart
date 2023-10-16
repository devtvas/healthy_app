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
  final _formKey = GlobalKey<FormState>();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(labelText: 'Login'),
                validator: (value) => validateUsername(value),
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Senha'),
                validator: (value) => validatePassword(value),
              ),
              ElevatedButton(
                onPressed: _handleLogin,
                child: const Text('Entrar'),
              ),
              // ElevatedButton(
              //   onPressed: _handleRegister,
              //   child: const Text('Cadastrar'),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  validateUsername(String? value) {
    if (value!.isEmpty) {
      return 'Por favor, digite um nome de usuário';
    }
    // Adicione aqui outras regras de validação para o nome de usuário, se necessário
    return null; // Retorna null se a validação for bem-sucedida
  }

  validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Por favor, digite uma senha';
    }
    if (value.length < 6) {
      return 'A senha deve ter pelo menos 6 caracteres';
    }
    return null; // Retorna null se a validação for bem-sucedida
  }

  Future<void> _handleRegister() async {
    final username = usernameController.text;
    final password = passwordController.text;
    if (username.isNotEmpty && password.isNotEmpty) {
      final user = UserModel(id: 0, username: username, password: password);
      await signinController.saveUser(user);
      // Redirecionar para a página de login ou realizar outra ação apropriada
      // Modular.to.pop();
      usernameController.clear();
      passwordController.clear();
    } else {
      // Exibir mensagem de erro se campos estiverem vazios
    }
  }

  _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      final userModel = UserModel(
          id: 0,
          username: usernameController.text,
          password: passwordController.text);
      //busca usuario
      final userBD = await signinController.getUser(userModel);
      //valida se tem usuario
      if (userBD.username == usernameController.text &&
          userBD.password == passwordController.text) {
        //user.password == passwordController.text
        // Login bem-sucedido
        // Navegar para a próxima tela ou executar ação apropriada
        log('bem-sucedido');
        Modular.to.pushNamed('/home');
      } else {
        // Exibir mensagem de erro
        log('usuario ou senhas inválidos!');
      }
    } else {
      log('no-mounted');
    }
  }
}
