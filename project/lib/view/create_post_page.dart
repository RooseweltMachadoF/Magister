import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:project/controller/feed_controller.dart';
import 'package:project/model/sala_model.dart';

class CreatePostScreen extends StatelessWidget {
  final FeedController controller = FeedController();
  final SalaModel salaModel;

  final TextEditingController authorController = TextEditingController();
  final TextEditingController textController = TextEditingController();

  CreatePostScreen({super.key, required this.salaModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar um Post'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: authorController,
                decoration: const InputDecoration(labelText: 'Autor'),
              ),
              TextField(
                controller: textController,
                decoration: const InputDecoration(labelText: 'Texto'),
              ),
              const SizedBox(height: 16.0),
              Observer(
                builder: (_) {
                  return controller.image == null
                      ? const Text('No image selected.')
                      : Image.file(controller.image!);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () => controller.getImage('camera'),
                    child: const Text('Camera'),
                  ),
                  ElevatedButton(
                    onPressed: () => controller.getImage('galeria'),
                    child: const Text('Gallery'),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Observer(
                builder: (_) {
                  return controller.isLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            controller.uploadPost(authorController.text,
                                textController.text, salaModel);
                          },
                          child: const Text('Criar'),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
