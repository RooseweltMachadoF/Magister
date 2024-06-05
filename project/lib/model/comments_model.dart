class CommentsModel {
  String id;
  String author;
  String text;
  String postId;

  CommentsModel({
    required this.id,
    required this.author,
    required this.text,
    required this.postId,
  });

  factory CommentsModel.fromMap(Map<String, dynamic> map) {
    return CommentsModel(
      id: map['id'] ?? '',
      author: map['author'] ?? '',
      text: map['text'] ?? '',
      postId: map['postId'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'author': author,
      'text': text,
      'postId': postId,
    };
  }
}
