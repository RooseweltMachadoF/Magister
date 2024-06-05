import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:project/controller/add_user_controller.dart';
import 'package:project/model/sala_model.dart';
import 'package:project/widgets/action_card.dart';
import 'package:provider/provider.dart';

class AddUserSalaListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final salaController = Provider.of<AddUserSalaController>(context);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 51, 102, 1),
      appBar: AppBar(
          title: const Text('Gerenciar salas'),
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Observer(
        builder: (_) {
          if (salaController.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (salaController.salas.isEmpty) {
            return Center(child: Text('Nenhuma sala encontrada'));
          }

          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: ListView.builder(
              itemCount: salaController.salas.length,
              itemBuilder: (context, index) {
                final room = salaController.salas[index];
                return ActionCard(
                  title: room.titulo,
                  description: room.descricao,
                  icon: Icons.book_outlined,
                  onTap: () {
                    _showSalaOptions(context, room, salaController);
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _showSalaOptions(BuildContext context, SalaModel sala,
      AddUserSalaController salaController) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Opções para a sala: ${sala.titulo}'),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  _showAddUserDialog(context, sala.id, salaController);
                },
                child: Text('Adicionar Usuário'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);
                  await salaController.deleteSala(sala.id);
                  if (salaController.errorMessage.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(salaController.errorMessage)),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Sala apagada com sucesso')),
                    );
                  }
                },
                child: Text('Apagar Sala'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showAddUserDialog(BuildContext context, String salaId,
      AddUserSalaController salaController) {
    final TextEditingController userEmailController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Adicionar Usuário'),
          content: TextField(
            controller: userEmailController,
            decoration: InputDecoration(labelText: 'Email do Usuário'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () async {
                String userEmail = userEmailController.text.trim();
                if (userEmail.isNotEmpty) {
                  await salaController.addUserToSala(salaId, userEmail);
                  Navigator.pop(context);
                  if (salaController.errorMessage.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(salaController.errorMessage)),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Usuário adicionado com sucesso')),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('Por favor, preencha o campo de email')),
                  );
                }
              },
              child: Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }
}
