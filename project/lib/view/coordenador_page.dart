import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/model/sala_model.dart';
import 'package:project/view/add_user_page.dart';
import 'package:project/view/promoter_user_page.dart';
import 'package:project/widgets/action_card.dart';

class CoordinatorScreen extends StatelessWidget {
  final String emailUser;
  const CoordinatorScreen({super.key, required this.emailUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Painel do Coordenador'),
        leading: const Icon(
          Icons.chevron_left,
          size: 30,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ActionCard(
              title: 'Promover Usuário',
              description: 'Promova um usuário a coordenador ou moderador.',
              icon: Icons.person_add,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PromoterUserScreen()),
                );
              },
            ),
            const SizedBox(height: 20.0),
            ActionCard(
              title: 'Criar Sala',
              description: 'Crie uma nova sala no aplicativo.',
              icon: Icons.add_box,
              onTap: () {
                _showCreateRoomForm(context);
              },
            ),
            const SizedBox(height: 20.0),
            ActionCard(
              title: 'Gerenciar Salas',
              description: 'Apague sala no aplicativo ou adicione usuários.',
              icon: Icons.add_box,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddUserSalaListPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showCreateRoomForm(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: CreateRoomForm(
            emailUser: emailUser,
          ),
        );
      },
    );
  }
}

class CreateRoomForm extends StatelessWidget {
  final String emailUser;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  CreateRoomForm({super.key, required this.emailUser});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Criar Nova Sala',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20.0),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Nome da Sala'),
          ),
          const SizedBox(height: 20.0),
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(labelText: 'Descrição da Sala'),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(0, 51, 102, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onPressed: () {
              _createRoom(context, emailUser);
            },
            child: const Text(
              'Criar',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _createRoom(BuildContext context, String currentEmail) {
    String name = _nameController.text.trim();
    String description = _descriptionController.text.trim();

    if (name.isNotEmpty && description.isNotEmpty) {
      SalaModel sala = SalaModel(
        id: '',
        titulo: name,
        descricao: description,
        usuarios: [], // Lista inicial de usuários vazia
        feed: [], // Feed inicial vazio
      );

      FirebaseFirestore.instance
          .collection('salas')
          .add(sala.toMap())
          .then((value) {
        print('Sala criada com sucesso: ${value.id}');
        Navigator.pop(context);
      }).catchError((error) {
        print('Erro ao criar sala: $error');
      });
    } else {
      // Exibir mensagem de erro se os campos estiverem vazios
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, preencha todos os campos.'),
        ),
      );
    }
  }
}
