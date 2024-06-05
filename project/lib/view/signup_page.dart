import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:project/controller/auth_controller.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _matriculaController = TextEditingController();
  final MaskedTextController _telefoneController =
      MaskedTextController(mask: '(00) 00000-0000');

  SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Senha'),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Confirmar Senha'),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: _fullNameController,
                decoration: const InputDecoration(labelText: 'Nome Completo'),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: _matriculaController,
                decoration: const InputDecoration(labelText: 'Matrícula'),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: _telefoneController,
                decoration: const InputDecoration(labelText: 'Telefone'),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: _dateOfBirthController,
                decoration:
                    const InputDecoration(labelText: 'Data de Nascimento'),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    _dateOfBirthController.text =
                        pickedDate.toLocal().toString().split(' ')[0];
                  }
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                  String email = _emailController.text.trim();
                  String password = _passwordController.text.trim();
                  String confirmPassword =
                      _confirmPasswordController.text.trim();
                  String fullName = _fullNameController.text.trim();
                  String matricula = _matriculaController.text.trim();
                  String telefone = _telefoneController.text.trim();
                  DateTime dateOfBirth =
                      DateTime.parse(_dateOfBirthController.text.trim());

                  if (password != confirmPassword) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('As senhas não coincidem.'),
                      ),
                    );
                    return;
                  }

                  if (email.isNotEmpty &&
                      password.isNotEmpty &&
                      fullName.isNotEmpty &&
                      _dateOfBirthController.text.isNotEmpty &&
                      matricula.isNotEmpty &&
                      telefone.isNotEmpty) {
                    bool success = await authController.signUp(
                      email,
                      password,
                      fullName,
                      dateOfBirth,
                      matricula,
                      telefone,
                    );
                    if (success) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Usuário cadastrado com sucesso.'),
                        ),
                      );
                      Navigator.pop(context); // Voltar para a tela de login
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Erro ao cadastrar usuário.'),
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Por favor, preencha todos os campos.'),
                      ),
                    );
                  }
                },
                child: const Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
