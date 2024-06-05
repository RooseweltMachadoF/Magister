import 'package:flutter/material.dart';
import 'package:project/controller/post_controller.dart';
import 'package:project/model/post_model.dart';
import 'package:project/model/sala_model.dart';
import 'package:project/model/usuario_model.dart';
import 'package:project/view/create_post_page.dart';
import 'package:project/widgets/post_item.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class FeedScreen extends StatelessWidget {
  final SalaModel salaModel;
  final UserModel currentUser;

  const FeedScreen(
      {super.key, required this.salaModel, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    final postController = PostController(salaModel.id);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(0, 51, 102, 1),
      appBar: AppBar(
        title: Text(
          salaModel.titulo,
          style: const TextStyle(color: Colors.white),
        ),
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
      body: Observer(
        builder: (_) {
          if (postController.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return FeedList(
            postController: postController,
            posts: postController.posts.toList(),
            currentUser: currentUser,
            salaId: salaModel.id,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newPost = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CreatePostScreen(salaModel: salaModel)),
          );

          if (newPost != null) {
            postController.addPost(newPost);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class FeedList extends StatelessWidget {
  final List<Post> posts;
  final UserModel currentUser;
  final String salaId;
  final PostController postController;

  const FeedList(
      {super.key,
      required this.posts,
      required this.currentUser,
      required this.salaId,
      required this.postController});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return PostItem(
          postController: postController,
          salaId: salaId,
          post: posts[index],
          currentUser: currentUser,
        );
      },
    );
  }
}
