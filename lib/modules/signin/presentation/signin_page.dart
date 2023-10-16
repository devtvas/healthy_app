import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthy_app/core/colors/app_colors.dart';

import '../data/model/user_model.dart';
import 'signin_controller.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final signinController = Modular.get<SigninController>();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 50),
                // Insira seu logotipo aqui (substitua "logo.png" pelo seu caminho de imagem)
                Image.asset('assets/logo.png', width: 220, height: 220),

                const SizedBox(height: 20),

                // Campo de usuário
                TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: 'Login',
                    labelStyle: const TextStyle(color: AppColors.txtGreenLight),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: AppColors.txtBlueDark),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: AppColors.txtGreenLight),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  validator: (value) => validateUsername(value),
                ),

                const SizedBox(height: 10),

                // Campo de senha
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    labelStyle: const TextStyle(color: AppColors.txtGreenLight),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: AppColors.txtBlueDark),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: AppColors.txtGreenLight),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  validator: (value) => validatePassword(value),
                ),

                const SizedBox(height: 20),

                // Botão de entrada

                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: _handleLogin,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          child: Container(
                            width: width,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.btnBlueDark, // Cor de fundo
                            ),
                            child: const Center(
                              child: Text(
                                'Entrar',
                                style: TextStyle(
                                  color: Colors.white, // Cor do texto
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  '© 2023 HealthyCann',
                  style: TextStyle(color: AppColors.txtGrayLight),
                )
              ],
            ),
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
