import 'package:flutter/material.dart';
import 'package:project/model/usuario_model.dart';
import 'package:project/view/edit_profile_page.dart';

class ProfilePage extends StatelessWidget {
  final UserModel user;
  final bool? initialPage;
  const ProfilePage({super.key, required this.initialPage, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 51, 102, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 51, 102, 1),
        leading: initialPage!
            ? const SizedBox.shrink()
            : IconButton(
                icon: const Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                  size: 40,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 50,
              // backgroundImage: NetworkImage('URL_DA_IMAGEM'),
            ),
            const SizedBox(height: 20),
            Text(
              user.fullName,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              user.email,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Matrícula: ${user.matricula}',
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Telefone: ${user.telefone}',
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfilePage()),
                );
              },
              child: const Text('Editar Perfil'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Informações Adicionais:',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Descrição do usuário ou outras informações adicionais podem ser exibidas aqui.',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
