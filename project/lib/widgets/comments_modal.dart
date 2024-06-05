import 'package:flutter/material.dart';
import 'package:project/controller/comments_controller.dart';
import 'package:project/model/comments_model.dart';
import 'package:project/model/post_model.dart';
import 'package:project/model/usuario_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:uuid/uuid.dart';

class CommentsModal extends StatelessWidget {
  final String salaId;
  final Post post;
  final UserModel currentUser;

  const CommentsModal(
      {super.key,
      required this.post,
      required this.currentUser,
      required this.salaId});

  @override
  Widget build(BuildContext context) {
    final commentsController = CommentsController(salaId, post);
    TextEditingController textCommentController = TextEditingController();
    var uuid = Uuid();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Comentários'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Comentários',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Observer(
                builder: (_) {
                  if (commentsController.comments.isEmpty) {
                    return const Center(
                        child: Text('Nenhum comentário ainda.'));
                  }

                  return ListView.builder(
                    itemCount: commentsController.comments.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(commentsController.comments[index].author),
                        subtitle: Text(commentsController.comments[index].text),
                      );
                    },
                  );
                },
              ),
            ),
            TextField(
              controller: textCommentController,
              decoration: InputDecoration(
                labelText: 'Escreva um comentário...',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () async {
                    String content = textCommentController.text;
                    if (content.isNotEmpty) {
                      final comment = CommentsModel(
                        id: uuid.v4(),
                        author: currentUser.email,
                        text: content,
                        postId: post.id,
                      );
                      await commentsController.addComment(comment);
                      textCommentController.clear();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
