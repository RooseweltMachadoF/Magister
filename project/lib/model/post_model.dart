class Post {
  String id;
  String salaId;
  String author;
  String text;
  String? imageUrl;
  List<String> likes;
  List<String> comments;

  Post({
    required this.id,
    required this.salaId,
    required this.author,
    required this.text,
    this.imageUrl,
    required this.likes,
    required this.comments,
  });

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'] ?? '',
      salaId: map['salaId'] ?? '',
      author: map['author'] ?? '',
      text: map['text'] ?? '',
      imageUrl: map['imageUrl'],
      likes: List<String>.from(map['likes'] ?? []),
      comments: List<String>.from(map['comments'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'salaId': salaId,
      'author': author,
      'text': text,
      'imageUrl': imageUrl,
      'likes': likes,
      'comments': comments,
    };
  }
}
