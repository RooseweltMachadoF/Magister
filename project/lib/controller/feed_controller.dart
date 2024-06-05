import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:project/model/comments_model.dart';
import 'package:project/model/post_model.dart';
import 'package:project/model/sala_model.dart';
import 'package:project/model/usuario_model.dart';

part 'feed_controller.g.dart';

class FeedController = _FeedController with _$FeedController;

abstract class _FeedController with Store {
  @observable
  File? image;

  @observable
  bool isLoading = false;

  @action
  Future<void> getImage(String originImage) async {
    final ImagePicker picker = ImagePicker();
    XFile? imageSelected;
    switch (originImage) {
      case "camera":
        imageSelected = await picker.pickImage(source: ImageSource.camera);
        break;
      case "galeria":
        imageSelected = await picker.pickImage(source: ImageSource.gallery);
        break;
      default:
    }
    if (imageSelected != null) {
      image = File(imageSelected.path);
    }
  }

  @action
  Future<void> uploadPost(
      String author, String text, SalaModel salaModel) async {
    if (image == null) return;

    isLoading = true;
    try {
      // Upload image to Firebase Storage
      FirebaseStorage storage = FirebaseStorage.instance;
      String imagePath = 'posts/${DateTime.now().millisecondsSinceEpoch}.jpg';
      Reference reference = storage.ref().child(imagePath);
      await reference.putFile(image!);

      String imageUrl = await reference.getDownloadURL();
      String postId = FirebaseFirestore.instance.collection('posts').doc().id;

      final post = Post(
        id: postId,
        salaId: salaModel.id,
        author: author,
        text: text,
        likes: [],
        comments: [],
        imageUrl: imageUrl,
      );

      FirebaseFirestore firestore = FirebaseFirestore.instance;
      await firestore.collection('posts').doc(postId).set(post.toMap());

      image = null;
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
    }
  }

  Future<void> addLike(String postId, UserModel user) async {
    try {
      await FirebaseFirestore.instance
          .collection('posts')
          .doc(postId)
          .collection('likes')
          .doc(user.id)
          .set(user.toMap());
    } catch (e) {
      print('Erro ao adicionar like: $e');
    }
  }

  Future<void> addComment(String postId, CommentsModel comment) async {
    try {
      await FirebaseFirestore.instance
          .collection('posts')
          .doc(postId)
          .collection('comments')
          .add(comment.toMap());
    } catch (e) {
      print('Erro ao adicionar comentário: $e');
    }
  }
}
