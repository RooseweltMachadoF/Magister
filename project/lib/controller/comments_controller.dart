import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:project/model/comments_model.dart';
import 'package:project/model/post_model.dart';

part 'comments_controller.g.dart';

class CommentsController = _CommentsController with _$CommentsController;

abstract class _CommentsController with Store {
  final String salaId;
  final Post post;

  _CommentsController(this.salaId, this.post) {
    fetchComments();
    fetchLikes();
  }

  @observable
  ObservableList<CommentsModel> comments = ObservableList<CommentsModel>();

  @observable
  ObservableList<String> likes = ObservableList<String>();

  @action
  Future<void> fetchComments() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('comments')
          .where('postId', isEqualTo: post.id)
          .get();

      comments = ObservableList.of(snapshot.docs
          .map((doc) => CommentsModel.fromMap(doc.data()))
          .toList());
    } catch (e) {
      print('Erro ao buscar comentários: $e');
    }
  }

  @action
  Future<void> fetchLikes() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('posts')
          .doc(post.id)
          .get();

      List<String> fetchedLikes =
          List<String>.from(snapshot.data()?['likes'] ?? []);
      likes = ObservableList.of(fetchedLikes);
    } catch (e) {
      print('Erro ao buscar likes: $e');
    }
  }

  @action
  Future<void> addComment(CommentsModel comment) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Adiciona o comentário à coleção "comments"

      await firestore.collection('comments').add(comment.toMap());

      comments.add(comment); // Adiciona o comentário à lista local
    } catch (e) {
      print('Erro ao adicionar comentário: $e');
    }
  }

  @action
  Future<void> toggleLike(String userId) async {
    try {
      final docRef =
          FirebaseFirestore.instance.collection('posts').doc(post.id);

      if (likes.contains(userId)) {
        likes.remove(userId);
      } else {
        likes.add(userId);
      }

      await docRef.update({
        'likes': likes.toList(),
      });
    } catch (e) {
      print('Erro ao atualizar like: $e');
    }
  }
}
