import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:project/controller/post_controller.dart';
import 'package:project/model/post_model.dart';
import 'package:project/model/usuario_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/widgets/comments_modal.dart';

class PostItem extends StatefulWidget {
  final String salaId;
  final Post post;
  final UserModel currentUser;
  final PostController postController;

  const PostItem({
    super.key,
    required this.salaId,
    required this.post,
    required this.currentUser,
    required this.postController,
  });

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  bool like = false;

  Future<void> _toggleLike() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentReference postRef =
        firestore.collection('posts').doc(widget.post.id);
    try {
      if (widget.post.likes.contains(widget.currentUser.id)) {
        like = false;
        widget.post.likes.remove(widget.currentUser.id);
      } else {
        widget.post.likes.add(widget.currentUser.id);
        like = true;
      }
      setState(() {});
      await postRef.update({
        'likes': [widget.currentUser.id],
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                CircleAvatar(
                  child: Text(widget.post.author[0].toUpperCase()),
                ),
                const SizedBox(width: 10),
                Text(
                  widget.post.author,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (widget.post.imageUrl != null)
              Image.network(widget.post.imageUrl!),
            const SizedBox(height: 10),
            Text(widget.post.text),
            const SizedBox(height: 10),
            Row(
              children: <Widget>[
                Observer(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: Icon(
                        like ? Icons.favorite : Icons.favorite_border,
                        color: like ? Colors.red : null,
                      ),
                      onPressed: _toggleLike,
                    );
                  },
                ),
                Text('${widget.post.likes.length} likes'),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.comment),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => CommentsModal(
                        salaId: widget.salaId,
                        post: widget.post,
                        currentUser: widget.currentUser,
                      ),
                    );
                  },
                ),
                Text('${widget.post.comments.length} comments'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
