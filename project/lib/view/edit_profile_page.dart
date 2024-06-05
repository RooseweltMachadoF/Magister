import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(0, 51, 102, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 51, 102, 1),
        leading: IconButton(
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
            TextFormField(
              initialValue: 'Nome do Usuário',
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.white), // Cor do label
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors
                          .white), // Cor da borda quando o campo está focado
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors
                          .white), // Cor da borda quando o campo não está focado
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              initialValue: 'Email do Usuário',
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.white), // Cor do label
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors
                          .white), // Cor da borda quando o campo está focado
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors
                          .white), // Cor da borda quando o campo não está focado
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              initialValue: '(00) 12345-6789',
              decoration: const InputDecoration(
                labelText: 'Telefone',
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.white), // Cor do label
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors
                          .white), // Cor da borda quando o campo está focado
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors
                          .white), // Cor da borda quando o campo não está focado
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Adicione aqui a lógica para salvar as alterações do perfil
              },
              child: const Text('Salvar Alterações'),
            ),
          ],
        ),
      ),
    );
  }
}
