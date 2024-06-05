import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:project/controller/promoter_user_controller.dart';
import 'package:provider/provider.dart';

class PromoterUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<PromoterUserController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Usuários'),
        leading: const Icon(
          Icons.chevron_left,
          size: 30,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Observer(
          builder: (_) {
            if (userController.users.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              itemCount: userController.users.length,
              itemBuilder: (context, index) {
                final user = userController.users[index];
                return Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user.fullName,
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                Text(user.email),
                                const SizedBox(height: 8.0),
                              ],
                            ),
                            Row(
                              children: [
                                DropdownButton<String>(
                                  value: user.permission,
                                  items: const [
                                    DropdownMenuItem(
                                      child: Text("Coordinator"),
                                      value: "coordinator",
                                    ),
                                    DropdownMenuItem(
                                      child: Text("Moderator"),
                                      value: "moderator",
                                    ),
                                    DropdownMenuItem(
                                      child: Text("User"),
                                      value: "user",
                                    ),
                                  ],
                                  onChanged: (String? newValue) {
                                    if (newValue != null) {
                                      userController.updatePermission(
                                          user.id, newValue);
                                    }
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
