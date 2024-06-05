import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:project/model/post_model.dart';

part 'post_controller.g.dart';

class PostController = _PostController with _$PostController;

abstract class _PostController with Store {
  final String salaId;

  _PostController(this.salaId) {
    fetchPosts();
  }

  @observable
  ObservableList<Post> posts = ObservableList<Post>();

  @observable
  bool isLoading = false;

  @action
  Future<void> fetchPosts() async {
    isLoading = true;
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('posts')
          .where('salaId', isEqualTo: salaId)
          .get();
      posts = ObservableList.of(
        snapshot.docs
            .map((doc) => Post.fromMap(doc.data() as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      print('Error fetching posts: $e');
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> addPost(Post post) async {
    isLoading = true;
    try {
      await FirebaseFirestore.instance.collection('posts').add(post.toMap());
      posts.add(post);
    } catch (e) {
      print('Error adding post: $e');
    } finally {
      isLoading = false;
    }
  }
}
